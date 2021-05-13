//
//  DecorateShowProductsBeerLayout.swift
//  TheBar
//
//  Created by Bruno Meneghin on 03/03/21.
//

import UIKit

struct DecorateShowBeerProductsLayout: DrawableShowBeerProducts {
    typealias Layout = UIView
    
    // MARK: Subviews
    
    lazy var customBeerImageView = CustomImageView()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.clipsToBounds = true
        scroll.backgroundColor = .clear
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
    }()
    
    lazy var taglineLabel: UILabel = {
        let tagline = UILabel()
        tagline.textColor = .label
        tagline.numberOfLines = 2
        tagline.contentMode = .center
        tagline.textAlignment = .center
        tagline.lineBreakMode = .byTruncatingTail
        tagline.translatesAutoresizingMaskIntoConstraints = false
        tagline.font = UIFont(name: "KohinoorDevanagari-Semibold", size: 18.0)
        
        return tagline
    }()
    
    lazy var alcoholContentLabel: UILabel = {
        let content = UILabel()
        content.numberOfLines = 1
        content.textColor = .systemGray
        content.contentMode = .center
        content.textAlignment = .center
        content.lineBreakMode = .byTruncatingTail
        content.translatesAutoresizingMaskIntoConstraints = false
        content.font = UIFont(name: "KohinoorDevanagari-Regular", size: 16.0)
        
        return content
    }()
    
    lazy var bitternessScaleLabel: UILabel = {
        let bitterness = UILabel()
        bitterness.numberOfLines = 1
        bitterness.contentMode = .center
        bitterness.textColor = .lightGray
        bitterness.textAlignment = .center
        bitterness.lineBreakMode = .byTruncatingTail
        bitterness.translatesAutoresizingMaskIntoConstraints = false
        bitterness.font = UIFont(name: "KohinoorDevanagari-Regular", size: 14.0)
        
        return bitterness
    }()
    
    lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.text = ""
        description.textColor = .label
        description.numberOfLines = 0
        description.contentMode = .center
        description.textAlignment = .center
        description.lineBreakMode = .byTruncatingTail
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = UIFont(name: "KohinoorDevanagari-Regular", size: 17.0)
    
        return description
    }()
}

extension DrawableShowBeerProducts where Self == DecorateShowBeerProductsLayout {
    mutating func drawable(_ view: Layout) {
        
        // MARK: Draw
        
        let metricValue: CGFloat = 60.0
        
        view.backgroundColor = .systemBackground
        view.addSubview(self.scrollView)
    
        scrollView.addSubview(taglineLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(customBeerImageView)
        scrollView.addSubview(alcoholContentLabel)
        scrollView.addSubview(bitternessScaleLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            customBeerImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            customBeerImageView.heightAnchor.constraint(equalToConstant: view.frame.height/3.3),
            customBeerImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: metricValue / 2),
            customBeerImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: metricValue),
            customBeerImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -metricValue),
            
            taglineLabel.leadingAnchor.constraint(equalTo: customBeerImageView.leadingAnchor),
            taglineLabel.trailingAnchor.constraint(equalTo: customBeerImageView.trailingAnchor),
            taglineLabel.topAnchor.constraint(equalTo: customBeerImageView.bottomAnchor, constant: 10.0),
            
            alcoholContentLabel.leadingAnchor.constraint(equalTo: taglineLabel.leadingAnchor),
            alcoholContentLabel.trailingAnchor.constraint(equalTo: taglineLabel.trailingAnchor),
            alcoholContentLabel.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 8.0),
            bitternessScaleLabel.leadingAnchor.constraint(equalTo: alcoholContentLabel.leadingAnchor),
            bitternessScaleLabel.trailingAnchor.constraint(equalTo: alcoholContentLabel.trailingAnchor),
            bitternessScaleLabel.topAnchor.constraint(equalTo: alcoholContentLabel.bottomAnchor, constant: 7.5),
        
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20.0),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20.0),
            descriptionLabel.topAnchor.constraint(equalTo: bitternessScaleLabel.bottomAnchor, constant: 15.0)
        ])
        
        scrollView.sizeToFit()
        customBeerImageView.sizeToFit()
        
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        customBeerImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
