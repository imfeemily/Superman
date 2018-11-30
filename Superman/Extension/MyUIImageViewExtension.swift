//
//  MyUIImageViewExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 19/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

extension UIImageView {
    
    func load(image: String) {
        
        guard let nsurl = URL(string: image) else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: nsurl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func downloadImageFromUrl(image: String) {
        
        
        guard let nsurl = URL(string: image) else { return }
        let urlRequest = URLRequest(url: nsurl, cachePolicy: .reloadIgnoringCacheData)
        
        let imageDownloader = ImageDownloader.default
        if let imageCache = imageDownloader.imageCache as? AutoPurgingImageCache, let urlCache = imageDownloader.sessionManager.session.configuration.urlCache {
            _ = imageCache.removeImages(matching: urlRequest)
            urlCache.removeCachedResponse(for: urlRequest)
        }
        
        self.af_setImage(withURLRequest: urlRequest,
                         placeholderImage: nil,
                         filter: nil,
                         progress: nil,
                         progressQueue: DispatchQueue.main,
                         imageTransition: .crossDissolve(0.5),
                         runImageTransitionIfCached: false,
                         completion: nil)
        
    }
    
    func downloadImageFromUrlWithCache(image: String) {
        
        
        guard let nsurl = URL(string: image) else { return }
        
        self.af_setImage(
            withURL: nsurl,
            placeholderImage: nil,
            filter: nil,
            imageTransition: .crossDissolve(0.5)
        )
        
    }
}
