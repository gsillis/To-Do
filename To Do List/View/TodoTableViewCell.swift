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
        configLayoutCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - view

    private lazy var itemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0

        return label
    }()

    private func configLayoutCell() {
        tintColor = .systemGreen
    }

    func configCell(with item: Item) {
        itemTitleLabel.text = item.title
        accessoryType = item.done ? .checkmark : .none
    }
}

// MARK: - ViewProtocol

extension TodoTableViewCell: ViewProtocol {
    func configSubview() {
        addSubview(itemTitleLabel)
    }

    func configConstraint() {
        NSLayoutConstraint.activate([
            itemTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            itemTitleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            itemTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            itemTitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
}
