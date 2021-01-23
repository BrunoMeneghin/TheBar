//
//  WebService.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

import Foundation
 

class WebService {
    
    // MARK: Function
    
    func loadProducts(url: URL, completion: @escaping (Result<[Product]?, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data,
                                let response = response else {
                
                #if DEBUG
                if let err = error {
                    print(err.localizedDescription)
                }
                #endif
                
                return
            }
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  let products = try? JSONDecoder().decode([Product].self, from: data) else {
                
                #if DEBUG
                print("data: ", data.description)
                #endif
                
                return
            }
        
            switch httpURLResponse.statusCode {
            case 200...299:
                completion(.success(products))
                
            case 400:
                completion(.failure(HTTPCode.badRequest))
                
            case 404:
                completion(.failure(HTTPCode.notFound))
            
            case 500...511:
                completion(.failure(HTTPCode.serverError))
            
            default:
               break
            }
        }.resume()
    }
}
