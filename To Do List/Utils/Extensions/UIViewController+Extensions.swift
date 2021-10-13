//
//  Alert.swift
//  To Do List
//
//  Created by Gabriela Sillis on 12/10/21.
//

import UIKit


extension UIViewController {

    func showAlert(title: String, completion: @escaping(_ text: String) -> Void) {
        let alert: UIAlertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)

        alert.addTextField { (textfield) in
            textfield.placeholder = "Criar nova tarefa"
        }


        alert.addAction(UIAlertAction(title: "Criar", style: .default, handler: { _ in
            guard let texfield = alert.textFields?[0], let text = texfield.text else { return }
            let item = text.trimmingCharacters(in: .whitespacesAndNewlines)
            completion(item)
        }))

        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))

        present(alert, animated: true, completion: nil)
    }
}
