//
//  ShowBeerViewController.swift
//  TheBar
//
//  Created by Bruno Meneghin on 16/01/21.
//

import UIKit

class ShowBeerViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: Properties
    
    fileprivate lazy var decorate = DecorateShowProductsBeerLayout()

    // MARK: - Computed Properties
    
    private var defaultBeerImage: UIImage? {
        get {
            return UIImage(systemName: "photo.fill.on.rectangle.fill")
        }
    }
    
    // MARK: - Observable Properties
    
    var downloadBeerImageWithStringURL: String = "" {
        didSet {
            if downloadBeerImageWithStringURL != oldValue {
                decorate.customBeerImageView.downloadImage(from: downloadBeerImageWithStringURL)
            } else {
                decorate.customBeerImageView.image = defaultBeerImage
            }
            view.layoutIfNeeded()
        }
    }
    
    // MARK: Product Content
    
    var taglineContent: String = "" {
        didSet {
            if taglineContent != oldValue {
                decorate.taglineLabel.text = taglineContent
            }
        }
    }
    
    var alcoholContent: String = "" {
        didSet {
            if alcoholContent != oldValue {
                decorate.alcoholContentLabel.text = "Teor Alcoólico "
                                                    + alcoholContent
            }
        }
    }
    
    var bitternessScaleContent: String = "" {
        didSet {
            if bitternessScaleContent != oldValue {
                decorate.bitternessScaleLabel.text = "Escala de Amargor "
                                                     + bitternessScaleContent
            }
        }
    }
    
    var descriptionContent: String = "" {
        didSet {
            if descriptionContent != oldValue {
                decorate.descriptionLabel.text = descriptionContent
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorate.scrollView.delegate = self
        decorate.drawable(view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        decorate.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width,
                                                height: UIScreen.main.bounds.height +
                                                        decorate.descriptionLabel.frame.height
        )
    }
}
