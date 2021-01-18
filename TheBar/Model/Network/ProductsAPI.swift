//
//  API.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

struct ProductsAPI {
    indirect enum URL: String {
        case productsBaseURL = "https://api.punkapi.com/v2"
    }
    
    indirect enum Path: String {
        case productsPath = "/beers"
    }
    
    static let productsURL: String = URL.productsBaseURL.rawValue
                                     + Path.productsPath.rawValue
    
    // MARK: Init
    
    let baseURL: URL
    let path: Path
    
    init(withBaseURL: URL, withPath: Path) {
        baseURL = withBaseURL
        path = withPath
    }
}
