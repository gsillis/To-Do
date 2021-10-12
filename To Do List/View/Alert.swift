//
//  Alert.swift
//  To Do List
//
//  Created by Gabriela Sillis on 12/10/21.
//

import UIKit


extension UIViewController {

    func showAlert(title: String, message: String, completion:(() -> Void)? = nil) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Adicionar", style: .default, handler: { _ in
            completion?()
        }))

        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))

        alert.addTextField { text in
            // implementar
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}
