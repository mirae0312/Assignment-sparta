//
//  WishListService.swift
//  MyTodoList
//
//  Created by mirae on 1/10/24.
//

import Foundation

class WishListService {
    guard let context = self.persistentContainer?.viewContext else {
        return
    }
    
    let task = Task(context: context)
    let request = task.title = Task.fetchRequest()
    let tasks = try? context.fetch(request)
    
    print(tasks)
}
