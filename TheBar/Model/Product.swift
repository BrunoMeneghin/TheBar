//
//  Product.swift
//  TheBar
//
//  Created by Bruno Meneghin on 15/01/21.
//

import Foundation

struct Product: Decodable {
    var beerName: String
    var beerTagline: String
    var beerImageURL: String
    var beerDescription: String
    var beerAlcoholContent: Double
    var beerBitternessScale: Double?

    // MARK: Enum Custom Keys
    
    private enum CodingKeys: String, CodingKey {
        case beerName = "name"
        case beerTagline = "tagline"
        case beerImageURL = "image_url"
        case beerAlcoholContent = "abv"
        case beerBitternessScale = "ibu"
        case beerDescription = "description"
    }
}
