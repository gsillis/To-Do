//
//  UserDefaultsPersistence.swift
//  To Do List
//
//  Created by Gabriela Sillis on 12/10/21.
//

import Foundation

class UserDefaultsPersistence {

    private let defaults = UserDefaults.standard
    var items = [String]()
    private let key = UserDefaults.Keys.todoKeyItem
    
    func fetchItems() {
        items = defaults.value(forKey: key) as? [String] ?? []
    }

    func saveNewItem(newItem: String) {
        items.append(newItem)
        defaults.set(items, forKey: key)
    }
}
