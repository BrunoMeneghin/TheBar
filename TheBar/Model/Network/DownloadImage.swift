//
//  DowloadImage.swift
//  TheBar
//
//  Created by Bruno Meneghin on 18/01/21.
//

import Foundation
import UIKit

struct DownloadableImageService {
    
    // MARK: Properties
    
    static let shared = DownloadableImageService()
    private let onCache: NSCache<NSString, UIImage>
   
    // MARK: - Init
    
    private init() {
        onCache = NSCache<NSString, UIImage>()
    }
    
    // MARK: Function
    
    func loadingImage(from url: URL, completion: @escaping ((UIImage?) -> Void)) {
        if let imageCached = onCache.object(forKey: url.absoluteString as NSString) {
            DispatchQueue.main.async {
                completion(imageCached)
            }
        } else {
            URLSession.shared.dataTask(with: url) { [onCache] (data, response, _) in
                guard let data = data,
                      let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                      let image = UIImage(data: data) else { return }
                
                onCache.setObject(image, forKey: url.absoluteString as NSString)
                
                DispatchQueue.main.async {
                    completion(image)
                }
            }.resume()
        }
    }
}
