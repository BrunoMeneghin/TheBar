//
//  WebService.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

import Foundation

final class WebService {
    
    // MARK: Function
    
    func products(url: URL, completion: @escaping (Result<[Product]?, HTTPClient>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil,
                  let data = data,
                  let response = response,
                  let httpURLResponse = response as? HTTPURLResponse else {
            
                #if DEBUG
                if let err = error {
                    debugPrint(err.localizedDescription)
                }
                #endif
                return
            }
            
            let products = try? JSONDecoder().decode([Product].self, from: data)

            switch httpURLResponse.statusCode {
            case 200...299: completion(.success(products))
            case 400...499: completion(.failure(.clientError))
            case 500...599: completion(.failure(.serverError))
            
            default:
                break
            }
        
            #if DEBUG
            print(httpURLResponse.statusCode)
            #endif
        }.resume()
    }
}
