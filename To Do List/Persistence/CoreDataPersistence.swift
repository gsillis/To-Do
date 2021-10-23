//
//  CoreDataPersistence.swift
//  To Do List
//
//  Created by Gabriela Sillis on 23/10/21.
//

import UIKit
import CoreData

class CoreDataPersistence {
    var items = [Item]()

    private static var appDelegate: AppDelegate {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Error to access app delegate")
        }

        return appDelegate
    }

    static var context: NSManagedObjectContext {
        return CoreDataPersistence.appDelegate.persistentContainer.viewContext
    }

    func fetchItems() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()

        do {
            items = try CoreDataPersistence.context.fetch(request)
        } catch  {
            print(error)
        }
    }

    func saveNewItem(newItem: Item) {
        items.append(newItem)
        save()
    }
    
    func toggleItem(index: Int) {
        items[index].done.toggle()
        save()
    }

    private func save() {
        CoreDataPersistence.appDelegate.saveContext()
    }
}
