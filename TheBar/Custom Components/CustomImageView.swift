//
//  CustomImageView.swift
//  TheBar
//
//  Created by Bruno Meneghin on 16/01/21.
//

import UIKit

class CustomImageView: UIImageView {
    
    // MARK: Properties
    
    fileprivate lazy var customBackgroundColor = UIColor.systemGray4
    
    // MARK: Init
    
    init() {
        super.init(frame: CGRect.zero)
        clipsToBounds = true
        layer.cornerRadius = 8.0
        backgroundColor = customBackgroundColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
