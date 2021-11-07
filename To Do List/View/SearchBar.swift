//
//  SearchBar.swift
//  To Do List
//
//  Created by Gabriela Sillis on 26/10/21.
//

import UIKit

final class SearchBar: UIView {

    private let persistence = CoreDataPersistence()

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.placeholder = "Buscar"
        searchBar.sizeToFit()

        return searchBar
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(searchBar)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func delegate(delegate: UISearchBarDelegate) {
        searchBar.delegate = delegate
    }
}
