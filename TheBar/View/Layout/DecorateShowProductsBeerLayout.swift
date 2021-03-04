//
//  DecorateShowProductsBeerLayout.swift
//  TheBar
//
//  Created by Bruno Meneghin on 03/03/21.
//

import UIKit

struct DecorateShowProductsBeerLayout: Drawable {
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
        tagline.textColor = .black
        tagline.numberOfLines = 2
        tagline.contentMode = .center
        tagline.textAlignment = .center
        tagline.lineBreakMode = .byTruncatingTail
        tagline.translatesAutoresizingMaskIntoConstraints = false
        tagline.font = UIFont(name: "KohinoorDevanagari-Semibold", size: 18.0)
        
        return tagline
    }()
    
    lazy var alcoholContentLabel: UILabel = {
        let tagline = UILabel()
        tagline.numberOfLines = 1
        tagline.textColor = .darkGray
        tagline.contentMode = .center
        tagline.textAlignment = .center
        tagline.lineBreakMode = .byTruncatingTail
        tagline.translatesAutoresizingMaskIntoConstraints = false
        tagline.font = UIFont(name: "KohinoorDevanagari-Regular", size: 16.0)
        
        return tagline
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
        description.textColor = .black
        description.numberOfLines = 0
        description.contentMode = .center
        description.textAlignment = .center
        description.lineBreakMode = .byTruncatingTail
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = UIFont(name: "KohinoorDevanagari-Regular", size: 17.0)
    
        return description
    }()
}

extension Drawable where Self == DecorateShowProductsBeerLayout {
    mutating func drawable(_ view: Layout) {
        
        // MARK: Draw
        
        let metricValue: CGFloat = 60.0
        
        view.backgroundColor = .white
        view.addSubview(self.scrollView)
    
        self.scrollView.addSubview(self.taglineLabel)
        self.scrollView.addSubview(self.descriptionLabel)
        self.scrollView.addSubview(self.customBeerImageView)
        self.scrollView.addSubview(self.alcoholContentLabel)
        self.scrollView.addSubview(self.bitternessScaleLabel)
        
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            self.customBeerImageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.customBeerImageView.heightAnchor.constraint(equalToConstant: view.frame.height/3.3),
            self.customBeerImageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: metricValue / 2),
            self.customBeerImageView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: metricValue),
            self.customBeerImageView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -metricValue),
            
            self.taglineLabel.leadingAnchor.constraint(equalTo: self.customBeerImageView.leadingAnchor),
            self.taglineLabel.trailingAnchor.constraint(equalTo: self.customBeerImageView.trailingAnchor),
            self.taglineLabel.topAnchor.constraint(equalTo: self.customBeerImageView.bottomAnchor, constant: 10.0),
            
            self.alcoholContentLabel.leadingAnchor.constraint(equalTo: self.taglineLabel.leadingAnchor),
            self.alcoholContentLabel.trailingAnchor.constraint(equalTo: self.taglineLabel.trailingAnchor),
            self.alcoholContentLabel.topAnchor.constraint(equalTo: self.taglineLabel.bottomAnchor, constant: 8.0),
            self.bitternessScaleLabel.leadingAnchor.constraint(equalTo: self.alcoholContentLabel.leadingAnchor),
            self.bitternessScaleLabel.trailingAnchor.constraint(equalTo: self.alcoholContentLabel.trailingAnchor),
            self.bitternessScaleLabel.topAnchor.constraint(equalTo: self.alcoholContentLabel.bottomAnchor, constant: 7.5),
        
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 20.0),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -20.0),
            self.descriptionLabel.topAnchor.constraint(equalTo: self.bitternessScaleLabel.bottomAnchor, constant: 15.0)
        ])
        
        self.scrollView.sizeToFit()
        self.customBeerImageView.sizeToFit()
        
        self.scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.customBeerImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
