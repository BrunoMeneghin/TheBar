//
//  DecorateDrawableBeerProducts.swift
//  TheBar
//
//  Created by Bruno Meneghin on 13/05/21.
//

import UIKit
import Foundation

struct DecorateDrawableBeerProducts: DrawableBeerProducts {
    
    // MARK: Properties

    typealias Layout = UIView
    lazy var tableView = CustomTableView(frame: CGRect.zero, style: .grouped)
}

extension DrawableBeerProducts where Self == DecorateDrawableBeerProducts {
    mutating func draw(with view: Layout) {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

