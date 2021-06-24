//
//  ProductsBeerViewController.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

import UIKit

private let cellIReusableIdentifier: String = "CellID"

class BeerViewController: UIViewController, DrawableBeers {
    
    // MARK: Properties
    
    var beerName = String()
    var beerTagline = String()
    var beerDescription = String()
    var beerAlcoholContent = String()
    var beerBitternessScale = String()
    var beerDownloadImageWithStringURL = String()
    
    fileprivate lazy var webService = WebService()
    fileprivate lazy var decorate = DecorateDrawableBeerProducts()
    
    private lazy var productsViewModel: ProductListViewModel? = nil
    private lazy var productsAPIViewModel = ProductAPIViewModel()
        
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productService()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        decorateBeerLayout()
    }
    
    // MARK: Functions
    
    private final func decorateBeerLayout() {
        navigationController?.navigationBar.topItem?.title = "Beers"
        
        decorate.draw(with: view)
        decorate.tableView.delegate = self
        decorate.tableView.dataSource = self
        decorate.tableView.register(BeerTableViewCell.self,
                                    forCellReuseIdentifier: cellIReusableIdentifier)
       
        view.layoutIfNeeded()
    }
    
    private func productService() {
        guard let url = URL(string: productsAPIViewModel.productsStringURL)
        else { return }
        
        webService.products(url: url) { [weak self] (result) in
            switch result {
            case .success(let product):
                if let product = product {
                    self?.productsViewModel = ProductListViewModel(productList: product)
                    
                    DispatchQueue.main.async { [weak self] in
                        self?.decorate.tableView.reloadData()
                    }
                }
            case .failure(let error):
                #if DEBUG
                print(error.identifier)
                #endif
                
                return
            }
        }
    }
}

extension BeerViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: TableView Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.productsViewModel?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productsViewModel?.numberOfRowsInSection(section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIReusableIdentifier, for: indexPath) as? BeerTableViewCell
        else { return UITableViewCell() }
       
        let productViewModel = self.productsViewModel?.productAtIndexPath(indexPath.row)
        
        cell.beerNameLabel.text = productViewModel?.productBeerName
        cell.beerImageView.downloadImage(from: productViewModel?.productBeerImage ?? "")
        cell.beerAlcoholContentLabel.text = String(Double(productViewModel?.productBeerAlcoholContent ?? 0))
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let productVM = self.productsViewModel?.productAtIndexPath(indexPath.row)
        else { return }

        beerName = productVM.productBeerName
        beerTagline = productVM.productBeerTagline
        beerDescription = productVM.productBeerDescription
        beerDownloadImageWithStringURL = productVM.productBeerImage
        beerAlcoholContent = String(Double(productVM.productBeerAlcoholContent))
        beerBitternessScale = String(Double(productVM.productBeerBitternessScale ?? 0))
       
        let showBeerViewController = ShowBeerViewController()
        showBeerViewController.drawableBeersDelegate = self
        navigationController?.pushViewController(showBeerViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(view.frame.width * 0.25)
    }
}
