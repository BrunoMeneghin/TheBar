//
//  TableView.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

import UIKit

class CustomTableView: UITableView {
    
    // MARK: Properties
    
    fileprivate let customBackgroundColor = UIColor.clear
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        contentInset = UIEdgeInsets(top: 0.0, left: 0, bottom: 1.0, right: 0.0)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = customBackgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
