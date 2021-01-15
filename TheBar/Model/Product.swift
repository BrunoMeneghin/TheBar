//
//  Product.swift
//  TheBar
//
//  Created by Bruno Meneghin on 15/01/21.
//

import Foundation

struct Product: Decodable {
    var beerName: String
    var beerImageURL: String
    var beerAlcoholContent: Double
    
    private enum CodingKeys: String, CodingKey {
        case beerName = "name"
        case beerImageURL = "image_url"
        case beerAlcoholContent = "abv"
    }
}
