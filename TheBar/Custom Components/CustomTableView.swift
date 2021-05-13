//
//  TableView.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

import UIKit

class CustomTableView: UITableView {
    
    // MARK: Properties
    
    fileprivate lazy var customBackgroundColor = UIColor.systemBackground
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        separatorInset = .zero
        separatorStyle = .none
        backgroundColor = customBackgroundColor
        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 0.0, left: 0, bottom: 1.5, right: 0.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
