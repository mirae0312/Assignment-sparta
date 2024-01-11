//
//  ViewController.swift
//  MyTodoList
//
//  Created by mirae on 1/10/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var todoListTableView: UITableView!
    @IBAction func tapListButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "TodoListViewController") else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

