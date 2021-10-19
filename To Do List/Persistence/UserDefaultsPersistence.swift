//
//  UserDefaultsPersistence.swift
//  To Do List
//
//  Created by Gabriela Sillis on 12/10/21.
//

import Foundation

class UserDefaultsPersistence {

    private let defaults = UserDefaults.standard
    private let key = UserDefaults.Keys.todoKeyItem
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    var items = [Item]()
    
    func fetchItems() {
        guard let data = defaults.value(forKey: key) as? Data else { return }

        do {
            items = try decoder.decode([Item].self, from: data)
        } catch  {
            print(error)
        }
    }

    func saveNewItem(newItem: Item) {
        items.append(newItem)
        guard let encondedData = try? encoder.encode(items) else { return }
        defaults.set(encondedData, forKey: key)
    }
}
