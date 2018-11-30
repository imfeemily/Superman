//
//  MyNavigationControllerExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 19/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func removeHairLine() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.navigationBar.shadowImage = UIImage()
    }
    
    func orangeNav() {
        self.navigationBar.barTintColor = UIColor.kerryOrange
        self.navigationBar.tintColor = .white
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationBar.isHidden = false
        self.view.backgroundColor = .clear
        self.navigationBar.isTranslucent = false
        self.removeHairLine()
    }
    
    func whiteNav() {
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.tintColor = UIColor.kerryGray
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.kerryGray]
        self.navigationBar.isHidden = false
        self.view.backgroundColor = .clear
        self.navigationBar.isTranslucent = false
        self.removeHairLine()
    }
    
    func addNavBarImage(titleImage: UIImage) {
        
        let imageView = UIImageView.init(image: titleImage)
        
        let bannerWidth = self.navigationBar.frame.size.width
        let bannerHeight = self.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - (titleImage.size.width) / 2
        let bannerY = bannerHeight / 2 - (titleImage.size.height) / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
}

extension UINavigationBar {
    
    func setupNavigationBar(image: UIImage) {
        let titleImageWidth = frame.size.width * 0.32
        let titleImageHeight = frame.size.height * 0.64
        var navigationBarIconimageView = UIImageView()
        if #available(iOS 11.0, *) {
            navigationBarIconimageView.widthAnchor.constraint(equalToConstant: titleImageWidth).isActive = true
            navigationBarIconimageView.heightAnchor.constraint(equalToConstant: titleImageHeight).isActive = true
        } else {
            navigationBarIconimageView = UIImageView(frame: CGRect(x: 0, y: 0, width: titleImageWidth, height: titleImageHeight))
        }
        navigationBarIconimageView.contentMode = .scaleAspectFit
        navigationBarIconimageView.image = image
        topItem?.titleView = navigationBarIconimageView
    }
    
}
