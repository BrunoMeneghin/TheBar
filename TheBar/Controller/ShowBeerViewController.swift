//
//  ShowBeerViewController.swift
//  TheBar
//
//  Created by Bruno Meneghin on 16/01/21.
//

import UIKit

class ShowBeerViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Setup Views
    
    private lazy var customBeerImageView = CustomImageView()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.clipsToBounds = true
        scroll.backgroundColor = .clear
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
    }()
    
    private lazy var beerTaglineLabel: UILabel = {
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
    
    private lazy var alcoholContentLabel: UILabel = {
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
    
    private lazy var bitternessScaleLabel: UILabel = {
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
    
    // MARK: - Computed Properties
    
    private var defaultBeerImage: UIImage? {
        get {
            return UIImage(systemName: "photo.fill.on.rectangle.fill")
        }
    }
    
    // MARK: - Observable Properties
    
    var donwloadBeerImageWithStringURL: String = "" {
        didSet {
            if donwloadBeerImageWithStringURL != oldValue {
                customBeerImageView.downloaded(from: donwloadBeerImageWithStringURL)
            } else {
                customBeerImageView.image = defaultBeerImage
            }
            view.layoutIfNeeded()
        }
    }
    
    var beerTagline: String = "" {
        didSet {
            if beerTagline != oldValue {
                beerTaglineLabel.text = beerTagline
            }
        }
    }
    
    var alcoholContent: String = "" {
        didSet {
            if alcoholContent != oldValue {
                alcoholContentLabel.text = "Teor Alcoólico " + alcoholContent
            }
        }
    }
    
    var bitternessScale: String = "" {
        didSet {
            if bitternessScale != oldValue {
                bitternessScaleLabel.text = "Escala de amargor " + bitternessScale
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        constructUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width,
                                       height: UIScreen.main.bounds.height + 120.0)
    }
    
    // MARK: - Private Funcs
    
    private final func constructUI() {
        view.addSubview(scrollView)
        view.backgroundColor = .white
        
        let metricValue: CGFloat = 60.0
        
        scrollView.addSubview(beerTaglineLabel)
        scrollView.addSubview(customBeerImageView)
        scrollView.addSubview(alcoholContentLabel)
        scrollView.addSubview(bitternessScaleLabel)
        
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      
        customBeerImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        customBeerImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        customBeerImageView.heightAnchor.constraint(equalToConstant: view.frame.height/3.3).isActive = true
        customBeerImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: metricValue / 2).isActive = true
        customBeerImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: metricValue).isActive = true
        customBeerImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -metricValue).isActive = true
        
        beerTaglineLabel.leadingAnchor.constraint(equalTo: customBeerImageView.leadingAnchor).isActive = true
        beerTaglineLabel.trailingAnchor.constraint(equalTo: customBeerImageView.trailingAnchor).isActive = true
        beerTaglineLabel.topAnchor.constraint(equalTo: customBeerImageView.bottomAnchor, constant: 10.0).isActive = true
        
        alcoholContentLabel.leadingAnchor.constraint(equalTo: beerTaglineLabel.leadingAnchor).isActive = true
        alcoholContentLabel.trailingAnchor.constraint(equalTo: beerTaglineLabel.trailingAnchor).isActive = true
        alcoholContentLabel.topAnchor.constraint(equalTo: beerTaglineLabel.bottomAnchor, constant: 8.0).isActive = true
        
        bitternessScaleLabel.leadingAnchor.constraint(equalTo: alcoholContentLabel.leadingAnchor).isActive = true
        bitternessScaleLabel.trailingAnchor.constraint(equalTo: alcoholContentLabel.trailingAnchor).isActive = true
        bitternessScaleLabel.topAnchor.constraint(equalTo: alcoholContentLabel.bottomAnchor, constant: 7.5).isActive = true
        
        scrollView.sizeToFit()
        customBeerImageView.sizeToFit()
    }
}
