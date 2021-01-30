//
//  WebService.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

import Foundation

final class WebService {
    
    // MARK: Function
    
    func productsService(url: URL, completion: @escaping (Result<[Product]?, HTTPClient>) -> Void) {
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
            
            let products = try? JSONDecoder().decode([Product].self, from: data)
            guard let httpURLResponse = response as? HTTPURLResponse else { return }
          
            switch httpURLResponse.statusCode {

            case 200...299: completion(.success(products))
                
            case 400...499: completion(.failure(HTTPClient.clientError))
                
            case 500...599: completion(.failure(HTTPClient.serverError))
            
            default:
                break
            }
        
            #if DEBUG
            print(httpURLResponse.statusCode)
            #endif
            
        }.resume()
    }
    
}
