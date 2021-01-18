//
//  URLProtocol.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

import Foundation


/// URL String should to be only a gettable property
protocol URLProtocol {
    var stringURL: String { get }
}
