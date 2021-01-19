//
//  ImageView+Extension.swift
//  TheBar
//
//  Created by Bruno Meneghin on 16/01/21.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadImage(from url: String) {
        clipsToBounds = true
        tintColor = .lightGray
        contentMode = .scaleAspectFit
       
        self.image = UIImage(systemName: "photo.fill.on.rectangle.fill")
        
        guard let stringURLPathFromImage = URL(string: url) else { return }
       
        DownloadableImageService.shared.loadingImage(from: stringURLPathFromImage) { [weak self] (image) in
            
            guard let image = image else { return }
            
            self?.alpha = 0
            self?.image = image
           
            UIView.animate(withDuration: 0.4, animations: {
                self?.alpha = 0.8
            })
        }
    }
}

