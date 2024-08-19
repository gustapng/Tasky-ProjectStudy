//
//  UserDefaultsPersistence.swift
//  Tasky
//
//  Created by Gustavo Ferreira dos Santos on 18/08/24.
//

import Foundation

protocol Persistence {
    func saveData(data: Data, key: String)
    func loadData(key: String) -> Data?
}

class UserDefaultsPersistence: Persistence {
    func saveData(data: Data, key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadData(key: String) -> Data? {
        return UserDefaults.standard.data(forKey: key)
    }
}
