//
//  HttpClient.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

enum HTTPClient: Error {
    case success
    case clientError
    case serverError
    
    var identifier: String {
        switch self {
        case .success: return "Success"
        case .clientError: return "Client Error"
        case .serverError: return "Internal Server Error"
        }
    }
}

extension HTTPClient: Equatable {
    static func ==(lhs: HTTPClient, rhs: HTTPClient) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
