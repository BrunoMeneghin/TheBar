//
//  Drawable.swift
//  TheBar
//
//  Created by Bruno Meneghin on 04/03/21.
//

import UIKit

/// A type so that we can draw into a context
protocol DrawableShowBeerProducts {
    associatedtype Layout
    var scrollView: UIScrollView { mutating get set }
    var taglineLabel: UILabel { mutating get set }
    var descriptionLabel: UILabel { mutating get set }
    var alcoholContentLabel: UILabel { mutating get set }
    var bitternessScaleLabel: UILabel { mutating get set }
    var customBeerImageView: CustomImageView { mutating get set }
}
