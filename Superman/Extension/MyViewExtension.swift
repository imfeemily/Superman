//
//  MyViewExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 19/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import UIKit
import Material

extension UIView {
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        self.layer.add(animation, forKey: nil)
    }
}

extension UIView{
    
    var snapshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
        if UIGraphicsGetCurrentContext() != nil {
            drawHierarchy(in: bounds, afterScreenUpdates: true)
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return screenshot
        }
        return nil
    }
    
    func setCellShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 3
    }
    
    func setCellBorder() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
    }
    
    func withRounded(){
        layer.cornerRadius = layer.frame.height / 2
        clipsToBounds = true
    }
    
    func withShadow() {
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.frame.height / 2)
        layer.shadowColor = UIColor.flatBlack.cgColor
        layer.shadowOffset = CGSize.init(width: 0, height: 1)
        layer.shadowOpacity = 0.3
        layer.shadowPath = shadowPath.cgPath
        clipsToBounds = false
    }
    
    func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
    }
    
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func roundCorners(_ corners:UIRectCorner,_ cornerMask:CACornerMask, radius: CGFloat) {
        if #available(iOS 11.0, *){
            
            // Bottom Left  > Min X + Max Y
            // Bottom Right > Max X + Max Y
            // Top Left     > Min X + Min Y
            // Top Right    > Max X + Min Y
            
            self.clipsToBounds = false
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cornerMask
        }else{
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds,    byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
            self.layer.mask = rectShape
        }
    }
    
}

//MARK: - View for loading indicator
//      • Can use fade in-out
//      • Can custom loading message while indicator running
extension UIView{
    
    func fadeIn(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)  }
    
    func fadeOut(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
    
    func showBlurLoader(_ message: String = "pleaseWait".localized){
        
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            let blurEffect = UIBlurEffect(style: .light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
            activityIndicator.color = UIColor.kerryGray
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            activityIndicator.startAnimating()
            
            let labelMessage = UILabel()
            labelMessage.text = message
            labelMessage.textColor = UIColor.kerryGray
            labelMessage.font = RobotoFont.regular(with: 14)
            labelMessage.numberOfLines = 0
            labelMessage.textAlignment = .center
            
            blurEffectView.contentView.addSubview(activityIndicator)
            blurEffectView.contentView.addSubview(labelMessage)
            
            activityIndicator.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.size.equalTo(50)
            }
            
            labelMessage.snp.makeConstraints { (make) in
                make.top.equalTo(activityIndicator.snp.bottom).offset(8)
                make.width.equalToSuperview().offset(-20)
                make.centerX.equalToSuperview()
            }
            
            self.addSubview(blurEffectView)
        }
        
    }
    
    func updateMessage(_ message: String = "") {
        self.subviews.compactMap {  $0 as? UIVisualEffectView }.forEach {
            $0.contentView.subviews.compactMap{ $0 as? UILabel }.forEach {
                $0.text = message
            }
        }
    }
    
    func removeBluerLoader(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.subviews.compactMap {  $0 as? UIVisualEffectView }.forEach {
                $0.removeFromSuperview()
            }
        }
        
    }
}

extension CACornerMask {
    static let topLeft     = layerMinXMinYCorner
    static let topRight    = layerMaxXMinYCorner
    static let bottomLeft  = layerMinXMaxYCorner
    static let bottomRight = layerMaxXMaxYCorner
}
