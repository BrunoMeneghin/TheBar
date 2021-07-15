//
//  DrawableBeers.swift
//  TheBar
//
//  Created by Bruno Meneghin on 30/04/21.
//

import Foundation

/// A `protocol` so that we can present in a show beer products
protocol DrawableBeers: AnyObject {
    var beerName: String { get set }
    var beerTagline: String { get set }
    var beerDescription: String { get set }
    var beerAlcoholContent: String { get set }
    var beerBitternessScale: String { get set }
    var beerDownloadImageWithStringURL: String { get set }
}

