//
//  ProductsBeerViewController.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

import UIKit

private let cellIReusableIdentifier: String = "CellID"

class ProductsBeerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, URLProtocol {
    
    // MARK: Instances & Properties
    
    fileprivate lazy var webService = WebService()
    
    private var productsViewModel: ProductListViewModel?
    private lazy var tableView = CustomTableView(frame: CGRect.zero,
                                                 style: .grouped)
    
    // MARK: - Computed Properties
    
    var stringURL: String {
        get {
            return ProductsAPI.productsURL
        }
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductsBeerTableViewCell.self,
                           forCellReuseIdentifier: cellIReusableIdentifier)
        
        buildUI()
    }
    
    // MARK: Private func
    
    private func buildUI() {
        navigationController?.navigationBar.topItem?.title = "Beers"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    
        productsService()
    }
    
    private func productsService() {
       guard let url = URL(string: stringURL) else { return }
        
        webService.loadProducts(url: url) { (result) in
            switch result {
                
            case .success(let product):
                if let product = product {
                    self.productsViewModel = ProductListViewModel(productList: product)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.layoutIfNeeded()
                    }
                }
                
            case .failure(let error):
                #if DEBUG
                print(error.localizedDescription)
                #endif
                
                return
            }
        }
    }
    
    // MARK: - TableView Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.productsViewModel?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productsViewModel?.numberOfRowsInSection(section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIReusableIdentifier, for: indexPath) as? ProductsBeerTableViewCell else { return UITableViewCell() }
       
        let productViewModel = self.productsViewModel?.productAtIndexPath(indexPath.row)
        
        cell.beerNameLabel.text = productViewModel?.productBeerName
        cell.beerImageView.downloadImage(from: productViewModel?.productBeerImage ?? "")
        cell.beerAlcoholContentLabel.text = String(Double(productViewModel?.productBeerAlcoholContent ?? 0))
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productVM = self.productsViewModel?.productAtIndexPath(indexPath.row)
        
        let showDetailsBeerVC = ShowBeerViewController()
        showDetailsBeerVC.title = productVM?.productBeerName
        showDetailsBeerVC.taglineContent = productVM?.productBeerTagline ?? ""
        showDetailsBeerVC.descriptionContent = productVM?.productBeerDescription ?? ""
        showDetailsBeerVC.donwloadBeerImageWithStringURL = productVM?.productBeerImage ?? ""
        showDetailsBeerVC.alcoholContent = String(Double(productVM?.productBeerAlcoholContent ?? 0))
        showDetailsBeerVC.bitternessScale = String(Double(productVM?.productBeerBitternessScale ?? 0))
       
        navigationController?.pushViewController(showDetailsBeerVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(view.frame.width * 0.25)
    }
}
