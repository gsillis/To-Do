//
//  UserDefaults+Keys.swift
//  To Do List
//
//  Created by Gabriela Sillis on 12/10/21.
//

import Foundation

/* classe criada para estudar persistencia de dados
 usando user defaults

 User Defalts é uma layer de persistencia de dados, geralmente utilizado
 para salvar pouca quantidade de dados */


extension UserDefaults {
    struct Keys {
        static let todoKeyItem: String = "To Do List"
    }
}
