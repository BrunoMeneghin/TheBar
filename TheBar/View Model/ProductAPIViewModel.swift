//
//  ProductsAPIViewModel.swift
//  TheBar
//
//  Created by Bruno Meneghin on 26/01/21.
//

import Foundation

// MARK: Configure API URL

struct ProductAPIViewModel: URLProtocol {
    var productsStringURL: String {
        return ProductsAPI.productsURL
    }
}

