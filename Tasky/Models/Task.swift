//
//  Task.swift
//  Tasky
//
//  Created by Gustavo Ferreira dos Santos on 12/08/24.
//

import Foundation

struct Task {
    var title: String
    var description: String?
    var isCompleted: Bool = false
}

var tasks: [Task] = [
    Task(title: "Fazer café"),
    Task(title: "Estudar Swift", description: "MVC"),
    Task(title: "Treinar", description: "Boxe"),
]
