//
//  TodoView.swift
//  To Do List
//
//  Created by Gabriela Sillis on 12/10/21.
//

import UIKit


final class TodoView: UIView {

    // MARK: - tableView

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: TodoTableViewCell.identifier)

        return tableView
    }()

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewProtocol

extension TodoView: ViewProtocol {

    func configSubview() {
        addSubview(tableView)
    }

    func configConstraint() {
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: topAnchor),
             tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
             tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
             tableView.bottomAnchor.constraint(equalTo: bottomAnchor)]
        )
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension TodoView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.identifier,
                                                       for: indexPath) as? TodoTableViewCell else {
            return UITableViewCell()
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
