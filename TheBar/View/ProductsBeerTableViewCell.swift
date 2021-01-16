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
    
    // MARK: - Setup Views
    
    lazy var beerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemPink
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var beerNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.contentMode = .left
        label.textColor = .purple
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17.0)
        
        return label
    }()
    
    lazy var beerBitternessLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.contentMode = .left
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor(white: 0.8, alpha: 0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15.0)
      
        return label
    }()
    
    lazy var beerBitternessPrefixLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .purple
        label.contentMode = .left
        label.text = "Bitterness Content"
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15.0)
      
        return label
    }()
    
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        clipsToBounds = true
        selectionStyle = .none
        backgroundColor = customBackgroundColor
        
        let metricSpace: CGFloat = 10.0
     
        
        contentView.addSubview(beerImageView)
        contentView.addSubview(beerNameLabel)
        contentView.addSubview(beerBitternessLabel)
        contentView.addSubview(beerBitternessPrefixLabel)
        contentView.backgroundColor = customBackgroundColor
      
        NSLayoutConstraint.activate([
            beerImageView.widthAnchor.constraint(equalToConstant: .init(self.frame.width * 0.25)),
            beerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: metricSpace),
            beerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -metricSpace),
            beerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: metricSpace + metricSpace),
          
            beerNameLabel.centerYAnchor.constraint(equalTo: beerImageView.centerYAnchor, constant: -metricSpace),
            beerNameLabel.leadingAnchor.constraint(equalTo: beerImageView.trailingAnchor, constant: metricSpace),
            beerNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -(metricSpace + metricSpace)),
            
            beerBitternessPrefixLabel.leadingAnchor.constraint(equalTo: beerNameLabel.leadingAnchor),
            beerBitternessPrefixLabel.topAnchor.constraint(equalTo: beerNameLabel.bottomAnchor, constant: metricSpace / 2),
            
            beerBitternessLabel.centerYAnchor.constraint(equalTo: beerBitternessPrefixLabel.centerYAnchor),
            beerBitternessLabel.leadingAnchor.constraint(equalTo: beerBitternessPrefixLabel.trailingAnchor, constant: metricSpace)
        ])
    
        beerImageView.sizeToFit()
        beerNameLabel.sizeToFit()
        beerBitternessLabel.sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
