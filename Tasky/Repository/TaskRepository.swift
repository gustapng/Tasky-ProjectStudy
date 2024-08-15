//
//  TaskRepository.swift
//  Tasky
//
//  Created by Gustavo Ferreira dos Santos on 14/08/24.
//

import Foundation

class TaskRepository {
    var tasks: [Task] = []
    
    private init() {}

    static let shared = TaskRepository()
    
    func addTask(newTask: Task) {
        tasks.append(newTask)
    }
    
    func removeTask(at index: Int) {
        guard index >= 0, index < tasks.count else { return }
        tasks.remove(at: index)
    }
    
    func completeTask(at index: Int) {
        guard index >= 0, index < tasks.count else { return }
        tasks[index].isCompleted.toggle()
    }
}
