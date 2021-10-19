//
//  Item.swift
//  To Do List
//
//  Created by Gabriela Sillis on 19/10/21.
//

import Foundation

class Item: Codable {
    var title: String
    var done: Bool

    init(title: String, done: Bool = false) {
        self.title = title
        self.done = done 
    }
}
