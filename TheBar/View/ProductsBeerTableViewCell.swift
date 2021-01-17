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
    
    lazy var beerImageView = CustomImageView()
    
    lazy var beerNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.contentMode = .left
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17.0)
        
        return label
    }()
    
    lazy var beerAlcoholContentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.contentMode = .left
        label.textColor = .systemPink
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15.0)
      
        return label
    }()
    
    lazy var beerPrefixAlcoholContentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .gray
        label.contentMode = .left
        label.text = "Alcohol content"
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
        contentView.addSubview(beerAlcoholContentLabel)
        contentView.addSubview(beerPrefixAlcoholContentLabel)
        contentView.backgroundColor = customBackgroundColor
      
        NSLayoutConstraint.activate([
            beerImageView.widthAnchor.constraint(equalToConstant: .init(self.frame.width * 0.25)),
            beerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: metricSpace),
            beerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -metricSpace),
            beerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: metricSpace + metricSpace),
          
            beerNameLabel.centerYAnchor.constraint(equalTo: beerImageView.centerYAnchor, constant: -metricSpace),
            beerNameLabel.leadingAnchor.constraint(equalTo: beerImageView.trailingAnchor, constant: metricSpace),
            beerNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -(metricSpace + metricSpace)),
            
            beerPrefixAlcoholContentLabel.leadingAnchor.constraint(equalTo: beerNameLabel.leadingAnchor),
            beerPrefixAlcoholContentLabel.topAnchor.constraint(equalTo: beerNameLabel.bottomAnchor, constant: metricSpace / 2),
            
            beerAlcoholContentLabel.centerYAnchor.constraint(equalTo: beerPrefixAlcoholContentLabel.centerYAnchor),
            beerAlcoholContentLabel.leadingAnchor.constraint(equalTo: beerPrefixAlcoholContentLabel.trailingAnchor, constant: metricSpace)
        ])
    
        beerImageView.sizeToFit()
        beerNameLabel.sizeToFit()
        beerAlcoholContentLabel.sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
