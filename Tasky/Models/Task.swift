//
//  Task.swift
//  Tasky
//
//  Created by Gustavo Ferreira dos Santos on 12/08/24.
//

import Foundation

struct Task: Codable {
    var title: String
    var description: String?
    var isCompleted: Bool = false
}
