//
//  SearchBar.swift
//  To Do List
//
//  Created by Gabriela Sillis on 26/10/21.
//

import UIKit

final class SearchBar: UIView {

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.searchBarStyle = .default
        searchBar.showsCancelButton = true
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
}

// MARK: - UISearchBarDelegate

extension SearchBar: UISearchBarDelegate {

}
