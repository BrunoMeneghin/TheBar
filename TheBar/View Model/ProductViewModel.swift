//
//  ProductViewModel.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

import Foundation
import UIKit



// MARK: - Product List View Model

struct ProductListViewModel {
    let productList: [Product]
}


extension ProductListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.productList.count
    }
    
    func productAtIndexPath(_ indexPath: Int) -> ProductViewModel {
        let product = self.productList[indexPath]
        return ProductViewModel(product) 
    }


}

// MARK: - Product View Model

struct ProductViewModel {
    private let product: Product
}

extension ProductViewModel {
    init(_ product: Product) {
        self.product = product
    }
}

extension ProductViewModel {
    var productBeerName: String {
        return self.product.beerName
    }
    
    var productBeerTagline: String {
        return self.product.beerTagline
    }
    
    var productBeerImage: String {
        return self.product.beerImageURL
    }
    
    var productBeerDescription: String {
        return self.product.beerDescription
    }
    
    var productBeerAlcoholContent: Double {
        return self.product.beerAlcoholContent
    }

    var productBeerBitternessScale: Double? {
        return self.product.beerBitternessScale ?? 0
    }
}
