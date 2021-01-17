//
//  ShowBeerViewController.swift
//  TheBar
//
//  Created by Bruno Meneghin on 16/01/21.
//

import UIKit

class ShowBeerViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Setup Views
    
    fileprivate lazy var customBeerImageView = CustomImageView()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.clipsToBounds = true
        scroll.backgroundColor = .clear
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
    }()
    
    // MARK: - Computed Properties
    
    private var defaultBeerImage: UIImage? {
        get {
            return UIImage(systemName: "photo.fill.on.rectangle.fill")
        }
    }
    
    // MARK: - Observable Properties
    
    var donwloadBeerImageView: String = "" {
        didSet {
            if donwloadBeerImageView != oldValue {
                customBeerImageView.downloaded(from: donwloadBeerImageView)
            } else {
                print("notthing?")
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        constructUI()
    }
    
    // MARK: - Private Funcs
    
    private final func constructUI() {
        view.addSubview(scrollView)
        view.backgroundColor = .white
        
        let metricValue: CGFloat = 60.0
        
        scrollView.addSubview(customBeerImageView)
        
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
        
        scrollView.sizeToFit()
        customBeerImageView.sizeToFit()
    }
}
