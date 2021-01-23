//
//  HttpClient.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

enum HTTPCode: String {
    case success = "200: Request is success"
    case badRequest = "400: Bad request"
    case notFound = "404: The host has not been found"
    case serverError = "500: Internal server error"
    
    var identifier: String {
        get {
            return self.rawValue
        }
    }
}
