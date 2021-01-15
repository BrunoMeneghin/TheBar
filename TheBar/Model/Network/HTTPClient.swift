//
//  HttpClient.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

import UIKit

enum HTTPCode: String {
    case success = "200: Request is success"
    case notFound = "400: The client has not been found"
    case hostNotFound = "404: The host has not been found"
    case badRequest = "500: Bad request"
    
    var identifier: String {
        get {
            return self.rawValue
        }
    }
}
