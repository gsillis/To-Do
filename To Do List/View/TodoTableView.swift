//
//  TodoView.swift
//  To Do List
//
//  Created by Gabriela Sillis on 12/10/21.
//

import UIKit


final class TodoTableView: UIView {

    private let persistence = CoreDataPersistence()

    // MARK: - tableView

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: TodoTableViewCell.identifier)
        tableView.tableHeaderView = searchBar

        return tableView
    }()

    private lazy var searchBar: SearchBar = {
        let searchBar = SearchBar()
        searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 70)


        return searchBar
    }()

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        persistence.fetchItems()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func saveItem(item: Item) {
        persistence.saveNewItem(newItem: item)
        reloadLastItemAdded()
    }

    private func reloadLastItemAdded() {
        tableView.performBatchUpdates({
            let row = max(tableView.numberOfRows(inSection: 0), 0)
            tableView.insertRows(at: [IndexPath(row: row, section: 0)], with: .automatic)
        }, completion: nil)
    }
}

// MARK: - ViewProtocol

extension TodoTableView: ViewProtocol {

    func configSubview() {
        addSubview(tableView)
    }

    func configConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension TodoTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistence.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.identifier,
                                                       for: indexPath) as? TodoTableViewCell else {
            return UITableViewCell()
        }

        let item = persistence.items[indexPath.row]

        cell.configCell(with: item)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        persistence.toggleItem(index: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        /*metodo com mais opções para personalizar o swipe de remove*/

        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _, _, completionHandler in
            self.persistence.deleteItem(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")

        /*recebe um array de actions*/
        let configure = UISwipeActionsConfiguration(actions: [deleteAction])

        return configure
    }
}
