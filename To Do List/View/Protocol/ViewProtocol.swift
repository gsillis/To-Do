//
//  ViewProtocol.swift
//  To Do List
//
//  Created by Gabriela Sillis on 12/10/21.
//

import UIKit

protocol ViewProtocol: UIView  {
    func configView()
    func configSubview()
    func configConstraint()
}

extension ViewProtocol {
    func configView() {
        configSubview()
        configConstraint()
    }
}
