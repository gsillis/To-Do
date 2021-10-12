//
//  TodoTableViewCell.swift
//  To Do List
//
//  Created by Gabriela Sillis on 12/10/21.
//

import UIKit

final class TodoTableViewCell: UITableViewCell {

    // MARK: - identifier

    static var identifier: String {
        String(describing: TodoTableViewCell.self)
    }

    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - view

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Teste"

        return label
    }()
}

// MARK: - ViewProtocol

extension TodoTableViewCell: ViewProtocol {
    func configSubview() {
        addSubview(label)
    }

    func configConstraint() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            label.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
}
