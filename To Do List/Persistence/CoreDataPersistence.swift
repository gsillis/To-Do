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

    func fetchItems(with request: NSFetchRequest<Item> = Item.fetchRequest()) {
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

    func deleteItem(index: Int) {
        CoreDataPersistence.context.delete(items[index])
        items.remove(at: index)
        save()
    }

    func searchBy(text: String) {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "title contains[c] %@", text)
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        fetchItems(with: request)
    }

    private func save() {
        CoreDataPersistence.appDelegate.saveContext()
    }
}
