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
                return
            }
    
            #if DEBUG
            print(response)
            #endif
            
            let products = try? JSONDecoder().decode([Product].self, from: data)
            
            if let products = products {
                completion(products)
                #if DEBUG
                print(products.description)
                #endif
            }
            
        }.resume()
    }
}

extension Data {
    var prettyJson: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding:.utf8) else { return nil }

        return prettyPrintedString
    }
}
