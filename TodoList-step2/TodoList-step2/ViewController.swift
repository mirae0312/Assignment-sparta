//
//  ViewController.swift
//  TodoList-step2
//
//  Created by mirae on 12/20/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    
    var tasks = [Task]()  {
        // 프로퍼티 옵저버, tasks배열에 task가 추가될 때마다 유저디폴트에 task저장
        didSet {
            self.saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // 유저디폴트에 저장된 할일을 앱을 재시동해도 다시 불러옴
        self.loadTasks()
    }

    // Done
    @objc func doneButtonTap() {
        self.navigationItem.leftBarButtonItem = self.editButton
        // Done버튼 누르면 Edit에서 탈출.
        self.tableView.setEditing(false, animated: true)
    }
    
    // Eddit
    @IBAction func tapeditButton(_ sender: UIBarButtonItem) {
        guard !self.tasks.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
    }
    
    // Add
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        // Alert
        let alert = UIAlertController(title: "할 일 등록", message: "할 일을 입력해주세요.", preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            // Add > 텍스트필드에 있는 값을 가져옴.
            // Upload
            self?.tableView.reloadData()
        })
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "할 일을 입력해주세요." })
        self.present(alert, animated: true, completion: nil)
    
    }
    
    // Save
    func saveTasks() {
        let data = self.tasks.map {[
                "title": $0.title,
                "done": $0.done
        ]}
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    // Load
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return }
        self.tasks = data.compactMap{
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done)
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueResusableCell : 사용하지 않는 메모리를 낭비하지 않기 위해서 셀을 재사용
        // withIdentifier : 설정한 cell 이름
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
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
        if self.tasks.isEmpty { //모든셀이 삭제되면
            self.doneButtonTap() // Done버튼 메서드를 호출해서 편집모드를 빠져나오게 구현.
        }
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
    
}

extension ViewController: UITableViewDelegate {
    // didSelectRowAt : 셀을 선택하였을 때 어떤 셀이 선택되었는지 알려주는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // tasks 배열 요소에 접근해서 Done이 true이면 false, false면 true로 변경
        var task = self.tasks[indexPath.row]
        task.done = !task.done   // 반대가 되게해줌
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

