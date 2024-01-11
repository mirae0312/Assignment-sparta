//
//  TodoListTableView.swift
//  MyTodoList
//
//  Created by mirae on 1/11/24.
//

import Foundation
import UIKit

class TodoListTableViewController: UIViewController {
    @IBOutlet private weak var todoListTableView: UITableView!
    var tasks : [TodoListStruct] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        self.todoListTableView.delegate = self
        self.todoListTableView.dataSource = self
        self.todoListTableView.sectionHeaderHeight = UITableView.automaticDimension
        self.todoListTableView.estimatedSectionHeaderHeight = 0
        self.todoListTableView.register(UINib(nibName: "TodoTableViewHeaderFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "TodoTableViewHeaderFooterView")
    }
    
    // Add
    @IBAction func tapAddBtn(_ sender: UIBarButtonItem) {
        // Alert
        let alert = UIAlertController(title: "TodoList 추가", message: "할 일을 입력해주세요.", preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = TodoListStruct(title: title, done: false, category: "", content: "")
            self?.tasks.append(task)
            // Add > 텍스트필드에 있는 값을 가져옴.
            // Upload
            self?.todoListTableView.reloadData()
        })
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "할 일을 입력해주세요." })
        self.present(alert, animated: true, completion: nil)
        print("add")
    }

    // Create
    func saveData() {
        let data = self.tasks.map {[
            "title": $0.title,
            "done": $0.done,
            "category": $0.category,
            "content": $0.content
        ]}
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }

    // Read
    func getData() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return }
        self.tasks = data.compactMap{
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            guard let content = $0["content"] as? String else { return nil }
            guard let category = $0["category"] as? String else { return nil }
            return TodoListStruct(title: title, done: done, category: category, content: content)
        }
    }
    
    // Delete
    func deleteData() {
        
    }
    
    
}

extension TodoListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueResusableCell : 사용하지 않는 메모리를 낭비하지 않기 위해서 셀을 재사용
        // withIdentifier : 설정한 cell 이름
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        // 체크마크
        if task.done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    // commit for row at 이라는 메서드 구현
    // Delete버튼 > 어떤 셀이 선택되었는지 알려주는 메서드
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tasks.remove(at: indexPath.row) // remove cell 알려주는 것.
        tableView.deleteRows(at: [indexPath], with: .automatic) //automatic : 삭제버튼을 눌러서 삭제도 가능, 스와이프해서 삭제하는 기능도 사용가능.
        //            if self.tasks.isEmpty { //모든셀이 삭제되면
        //                self.doneButtonTap() // Done버튼 메서드를 호출해서 편집모드를 빠져나오게 구현.
        //            }
    }
    
    // 할일의 순서를 바꿀 수 있는 기능
    // move row at 메서드를 구현
    // 행이 다른 위치로 변경될 경우
    // souceIndexPath : 파라미터를 통해 위치를 알려줌
    // destinationIndexPath : 파라미터를 통해 어디로 이동했는지 알려줌.
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // 할일순서를 바꿨을 때 같이 저장되는 배열 재정렬.
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
    }
    
    //header 
//    func tableView(in tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.tasks[section].title.count
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = todoListTableView.dequeueReusableHeaderFooterView(withIdentifier: "TodoTableViewHeaderFooterView") as? TodoTableViewHeaderFooterView
//        headerView?.headerTitleLabel.text = self.tasks[section].category
//        return headerView
//    }
}

extension TodoListTableViewController: UITableViewDelegate {
    // didSelectRowAt : 셀을 선택하였을 때 어떤 셀이 선택되었는지 알려주는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // tasks 배열 요소에 접근해서 Done이 true이면 false, false면 true로 변경
        var task = self.tasks[indexPath.row]
        task.done = !task.done   // 반대가 되게해줌
        self.tasks[indexPath.row] = task
        self.todoListTableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
