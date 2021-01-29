//
//  HttpClient.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

enum HTTPCode: Error {
    case success
    case badRequest
    case notFound
    case serverError
    
    var identifier: String {
        switch self {
        case .success:
            return "200 ~ 299: Request is success"
        
        case .badRequest:
            return  "400: Bad request"
        
        case .notFound:
            return "404: The host has not been found"
        
        case .serverError:
            return "500 ~ 511: Internal server error"
        }
    }
}

extension HTTPCode: Equatable {
    static func ==(lhs: HTTPCode, rhs: HTTPCode) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
