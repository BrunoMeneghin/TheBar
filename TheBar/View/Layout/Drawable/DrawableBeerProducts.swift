//
//  DrawableBeerProducts.swift
//  TheBar
//
//  Created by Bruno Meneghin on 13/05/21.
//

import Foundation

protocol DrawableBeerProducts {
    associatedtype Layout
    var tableView: CustomTableView { mutating get set }
}
