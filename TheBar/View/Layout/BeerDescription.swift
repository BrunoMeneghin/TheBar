//
//  BeerDescription.swift
//  TheBar
//
//  Created by Bruno Meneghin on 15/07/21.
//

import Foundation

/// A `enum` so that we can present the Description across the App
enum BeerDescription {
    enum Feature {
        case beerView
        case beerDetail
    }

    enum BeerMessage {
        case alcoholContent
        case bitternessScale
    }

    case information(BeerMessage)
    case screenTitle(Feature)

    var title: String {
        let described: String
        switch self {
        case .screenTitle(.beerView): described = "Beers"
        case .screenTitle(.beerDetail): described = "Beer Detail"
        case .information(.alcoholContent): described = "Alcohol Content "
        case .information(.bitternessScale): described = "Bitterness Scale "
        }

        return described
    }

    /// All `Described Messages` so that we can present them in a list
    static let allMessagesDescribed: [Self] = [
        .information(.alcoholContent),
        .information(.bitternessScale),
        .screenTitle(.beerView),
        .screenTitle(.beerDetail),
    ]
}
