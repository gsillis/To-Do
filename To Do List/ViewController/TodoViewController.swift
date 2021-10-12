//
//  TodoViewController.swift
//  To Do List
//
//  Created by Gabriela Sillis on 12/10/21.
//

import UIKit

class TodoViewController: UIViewController {

    private var todoView: TodoTableView?

    override func loadView() {
        todoView = TodoTableView()
        view = todoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }

    private func configNavigationBar() {
        navigationItem.title = "To do Item"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTappedBarButtonItem))
    }

    @objc private func addTappedBarButtonItem() {
        showAlert(title: "teste", message: "teste", completion: nil)
    }
}

