//
//  ProductsBeerTableViewCell.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

import UIKit

class ProductsBeerTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    fileprivate let customBackgroundColor = UIColor.clear
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = customBackgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
