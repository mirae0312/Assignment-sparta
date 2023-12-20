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
        didSet { // 프로퍼티 옵저버, tasks 배열에 할일이 추가될 때마다 유저 디폴트에 할일이 저장됨
            self.saveTasks()
        }
    }// Task 배열 생성
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks() // 유저디폴츠에 저장된 할일을 앱을 껏다 켜도 다시 불러와주는것
        
    }

    @objc func doneButtonTap() {
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true) //done버튼 누르면 edit에서 빠져나오도록 함.
        
    }
    
    @IBAction func tapeditButton(_ sender: UIBarButtonItem) {
        guard !self.tasks.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: "할 일을 입력해주세요.", preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            //등록버튼을 눌럿을때 텍스트필드에 있는 값을 가져올 수 있다.
            // textFields는 배열인데, 우리는 하나만 넣어놨기 때문에 [0]로 접근했음.
            self?.tableView.reloadData() // add된 할일들을 테이블뷰에 새로새로 업로드해주는 것
        })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "할 일을 입력해주세요." })
        self.present(alert, animated: true, completion: nil)
    
    }
    func saveTasks() {
        let data = self.tasks.map {
            [
                "title": $0.title,
                "done": $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // 사용하지 않는 메모리를 낭비하지 않기 위해서 dequeueResusableCell을 이용해서 셀을 재사용 하는 것
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        // 셀 표시됐을 때 체크마크 표시되게 하는 코드
        if task.done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    // commit for row at 이라는 메서드 구현
    // 삭제버튼 눌렀을때, 삭제버튼이 눌린 셀이 어떤 셀인지 알려주는 메서드
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tasks.remove(at: indexPath.row) // remove cell 알려주는 것.
        tableView.deleteRows(at: [indexPath], with: .automatic) //automatic에니메이션을 설정하게 되면, 삭제버튼을 눌러서 삭제도 가능하고, 우리가 평소에 사용하던 스와이프해서 삭제하는 기능도 사용 가능하다.
        if self.tasks.isEmpty { //모든셀이 삭제되면
            self.doneButtonTap() // done버튼 메서드를 호출해서 편집모드를 빠져나오게 구현.
        }
    }
    
    //할일의 순서를 바꿀 수 있는 기능 구현
    // move row at 메서드를 구현 : 행이 다른 위치로 변경되면, souceIndexPath 파라미터를 통해 어디에 있었는지 알려주고, destinationIndexPath 파라미터를 통해 어디로 이동했는지 알려준다.
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // talbe뷰 셀이 재정렬 되면, 할일을 저장하는 배열도 재정렬 되어야함.
        // 따라서 테이블뷰 셀이 재정렬된 순서대로, tasks 배열도 재정렬 해줘야해서 아래 처럼 구현
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
    }
    
}

extension ViewController: UITableViewDelegate {
    // 메서드 정의 : 셀을 선택하였을 때 어떤 셀이 선택되었는지 알려주는 메서드 : didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // tasks 배열 요소에 접근해서, done이 true이면 false가 되게 만들어주고, false면 true 가 되게 만들어줄 것.
        var task = self.tasks[indexPath.row]
        task.done = !task.done   // 반대가 되게해줌
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

