//
//  WebService.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

import Foundation

class WebService {
    
    // MARK: Function
    
    func loadProducts(url: URL, completion: @escaping ([Product]?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data,
                                let response = response else {
                #if DEBUG
                print(error?.localizedDescription ?? Error.self)
                #endif
                
                completion(nil)
                return
            }
            
            guard let httpURLResponse = response as? HTTPURLResponse else { return }
           
            #if DEBUG
            self.verifyHTTPURLResponse(httpURLResponse)
            #endif
            
            guard let products = try? JSONDecoder().decode([Product].self, from: data) else { return }
            completion(products)
            
        }.resume()
    }
    
    private final func verifyHTTPURLResponse(_ HTTP: HTTPURLResponse) {
        switch HTTP.statusCode {
        case 200:
            print(HTTPCode.success.identifier)
            
        case 400:
            print(HTTPCode.hostNotFound.identifier)
            
        case 404:
            print(HTTPCode.hostNotFound.identifier)
        
        case 500:
            print(HTTPCode.badRequest.identifier)
        
        default:
           break
        }
    }
}
