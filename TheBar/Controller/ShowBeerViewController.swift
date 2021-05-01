//
//  ShowBeerViewController.swift
//  TheBar
//
//  Created by Bruno Meneghin on 16/01/21.
//

import UIKit

class ShowBeerViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: Delegates
    
    weak var drawableBeersDelegate: DrawableBeers?
    
    // MARK: Properties
    
    fileprivate lazy var decorate = DecorateShowBeerProductsLayout()
   
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorate.scrollView.delegate = self
        decorate.drawable(view)
        decorateBeerProducts()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        decorate.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width,
                                                height: UIScreen.main.bounds.height +
                                                        decorate.descriptionLabel.frame.height
        )
    }
    
    // MARK: Functions 
    
    private final func decorateBeerProducts() {
        guard let beerName = drawableBeersDelegate?.beerName,
              let tagline = drawableBeersDelegate?.beerTagline,
              let alcohol = drawableBeersDelegate?.beerAlcoholContent,
              let description = drawableBeersDelegate?.beerDescription,
              let bitternessScaleContent = drawableBeersDelegate?.beerBitternessScale,
              let beerImageURL = drawableBeersDelegate?.beerDownloadImageWithStringURL
        else { return }
        
        decorate.taglineLabel.text = tagline
        decorate.descriptionLabel.text = description
        decorate.alcoholContentLabel.text = alcohol
        decorate.bitternessScaleLabel.text = bitternessScaleContent
        decorate.customBeerImageView.downloadImage(from: beerImageURL)
        
        title = beerName
        view.layoutIfNeeded()
    }
}
