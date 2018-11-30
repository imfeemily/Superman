//
//  MyButtonExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 19/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import UIKit
import Material
import SnapKit

public enum UIButtonBorderSide {
    case Top, Bottom, Left, Right
}

extension UIButton {
    
    func centerVertically(padding: CGFloat = 6.0) {
        guard let imageSize = self.imageView?.image?.size,
            let text = self.titleLabel?.text,
            let font = self.titleLabel?.font
            else { return }
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + padding), right: 0.0)
        let labelString = NSString(string: text)
        let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: font])
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + padding), left: 0.0, bottom: 0.0, right: -titleSize.width)
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0;
        self.contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0.0, bottom: edgeOffset, right: 0.0)
    }
    
}

extension UIButton {
    
    func forDefaultBlue() {
        self.titleLabel?.font = UIFont.fontForButton()
        self.setTitleColor(UIColor.white, for: .normal)
        self.setBackgroundColor(UIColor.lightGray, for: .disabled)
        self.setBackgroundColor(UIColor.blue, for: .normal)
    }
    
    func forDefaultOrange() {
        self.titleLabel?.font = UIFont.fontForButton()
        self.setTitleColor(UIColor.white, for: .normal)
        self.setBackgroundColor(UIColor.lightGray, for: .disabled)
        self.setBackgroundColor(UIColor.kerryOrange, for: .normal)
    }
    
    func forDefaultGray() {
        self.titleLabel?.font = UIFont.fontForButton()
        self.setTitleColor(UIColor.white, for: .normal)
        self.setBackgroundColor(UIColor.lightGray, for: .disabled)
        self.setBackgroundColor(UIColor.kerryGray, for: .normal)
    }
    
    func forDefaultLightGray() {
        self.titleLabel?.font = UIFont.fontForButton()
        self.setTitleColor(UIColor.white, for: .normal)
        self.setBackgroundColor(UIColor.flatWhite, for: .disabled)
        self.setBackgroundColor(UIColor.lightGray, for: .normal)
    }
    
    func forBorderGray() {
        self.titleLabel?.font = UIFont.fontForButton()
        self.setTitleColor(UIColor.kerryGray, for: .normal)
        self.setBackgroundColor(UIColor.white, for: .normal)
        self.layer.borderColor = UIColor.kerryGray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }
    
    func forBorderLightGray() {
        self.titleLabel?.font = UIFont.fontForButton()
        self.setTitleColor(UIColor.lightGray, for: .normal)
        self.setBackgroundColor(UIColor.white, for: .normal)
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }
    
    func forBorderOrange() {
        self.titleLabel?.font = UIFont.fontForButton()
        self.setTitleColor(UIColor.kerryOrange, for: .normal)
        self.setBackgroundColor(UIColor.white, for: .normal)
        self.layer.borderColor = UIColor.kerryOrange.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }
    
    func forPlainLightGray() {
        self.titleLabel?.font = UIFont.fontForTinyButton()
        self.setTitleColor(UIColor.lightGray, for: .normal)
        self.setBackgroundColor(UIColor.clear, for: .normal)
    }
}

extension UIButton {
    
    func underline() {
        let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
    class SSBadgeButton: UIButton {
        
        var badgeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        var badge: String? {
            didSet {
                addBadgeToButon(badge: badge)
            }
        }
        
        public var badgeBackgroundColor = UIColor.red {
            didSet {
                badgeLabel.backgroundColor = badgeBackgroundColor
            }
        }
        
        public var badgeTextColor = UIColor.white {
            didSet {
                badgeLabel.textColor = badgeTextColor
            }
        }
        
        public var badgeFont = UIFont.systemFont(ofSize: 12.0) {
            didSet {
                badgeLabel.font = badgeFont
            }
        }
        
        public var badgeEdgeInsets: UIEdgeInsets? {
            didSet {
                addBadgeToButon(badge: badge)
            }
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addBadgeToButon(badge: badge)
        }
        
        func addBadgeToButon(badge: String?) {
            
            badgeLabel.text = badge
            badgeLabel.textColor = badgeTextColor
            badgeLabel.backgroundColor = badgeBackgroundColor
            badgeLabel.font = badgeFont
            badgeLabel.sizeToFit()
            badgeLabel.textAlignment = .center
            
            let badgeSize = badgeLabel.frame.size
            
            let height = max(18, Double(badgeSize.height) + 5.0)
            let width = max(height, Double(badgeSize.width) + 10.0)
            
            var vertical: Double?, horizontal: Double?
            if let badgeInset = self.badgeEdgeInsets {
                vertical = Double(badgeInset.top) - Double(badgeInset.bottom)
                horizontal = Double(badgeInset.left) - Double(badgeInset.right)
                
                let x = (Double(bounds.size.width) - 10 + horizontal!)
                let y = -(Double(badgeSize.height) / 2) - 10 + vertical!
                badgeLabel.frame = CGRect(x: x, y: y, width: width, height: height)
            } else {
                let number: Double = badge?.count == 3 ? 3.0 : 2.0
                let x = self.frame.width + CGFloat((width / number))
                let y = CGFloat(-(height / 3.0))
                badgeLabel.frame = CGRect(x: x, y: y, width: CGFloat(width), height: CGFloat(height))
            }
            
            self.addSubview(badgeLabel)
            
            badgeLabel.layer.cornerRadius = badgeLabel.frame.height/2
            badgeLabel.layer.borderWidth = 1
            badgeLabel.layer.borderColor = UIColor.lightGray.cgColor
            badgeLabel.layer.masksToBounds = true
            badgeLabel.snp.makeConstraints { make in
                make.size.greaterThanOrEqualTo(badgeLabel.frame.height).multipliedBy(0.5)
                make.right.equalToSuperview().offset(badgeLabel.frame.height).multipliedBy(0.5)
                make.top.equalToSuperview().offset(-5)
            }
            
            badgeLabel.isHidden = badge != "" ? false : true
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.addBadgeToButon(badge: badge)
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    func leftImage(image: UIImage, renderMode: UIImage.RenderingMode) {
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: image.size.width / 2)
        self.contentHorizontalAlignment = .left
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    func rightImage(image: UIImage, renderMode: UIImage.RenderingMode){
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left:image.size.width / 2, bottom: 0, right: 0)
        self.contentHorizontalAlignment = .right
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    func addBorder(side: UIButtonBorderSide, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        
        switch side {
        case .Top:
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
        case .Bottom:
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        case .Left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .Right:
            border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        }
        
        self.layer.addSublayer(border)
    }
}

extension UIButton {
    
    func roundedButtonBottomLeft(radius: Int){
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: [.bottomLeft],
                                    cornerRadii:CGSize.init(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    func roundedButtonBottomRight(radius: Int){
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: [.bottomRight],
                                    cornerRadii:CGSize.init(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    func roundedButtonTopLeft(radius: Int){
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: [.topLeft],
                                    cornerRadii:CGSize.init(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    func roundedButtonTopRight(radius: Int){
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: [.topRight],
                                    cornerRadii:CGSize.init(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    func roundedButtonBottomLeftRight(radius: Int){
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: [.bottomLeft, .bottomRight],
                                    cornerRadii:CGSize.init(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    func roundedButtonTopLeftRight(radius: Int){
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: [.topLeft, .topRight],
                                    cornerRadii:CGSize.init(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}

var disabledColorHandle: UInt8 = 0
var highlightedColorHandle: UInt8 = 0
var selectedColorHandle: UInt8 = 0

extension UIButton {
    // https://stackoverflow.com/questions/14523348/how-to-change-the-background-color-of-a-uibutton-while-its-highlighted
    private func image(withColor color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(image(withColor: color), for: state)
    }
    
    @IBInspectable
    var disabledColor: UIColor? {
        get {
            if let color = objc_getAssociatedObject(self, &disabledColorHandle) as? UIColor {
                return color
            }
            return nil
        }
        set {
            if let color = newValue {
                self.setBackgroundColor(color, for: .disabled)
                objc_setAssociatedObject(self, &disabledColorHandle, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            } else {
                self.setBackgroundImage(nil, for: .disabled)
                objc_setAssociatedObject(self, &disabledColorHandle, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    @IBInspectable
    var highlightedColor: UIColor? {
        get {
            if let color = objc_getAssociatedObject(self, &highlightedColorHandle) as? UIColor {
                return color
            }
            return nil
        }
        set {
            if let color = newValue {
                self.setBackgroundColor(color, for: .highlighted)
                objc_setAssociatedObject(self, &highlightedColorHandle, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            } else {
                self.setBackgroundImage(nil, for: .highlighted)
                objc_setAssociatedObject(self, &highlightedColorHandle, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    @IBInspectable
    var selectedColor: UIColor? {
        get {
            if let color = objc_getAssociatedObject(self, &selectedColorHandle) as? UIColor {
                return color
            }
            return nil
        }
        set {
            if let color = newValue {
                self.setBackgroundColor(color, for: .selected)
                objc_setAssociatedObject(self, &selectedColorHandle, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            } else {
                self.setBackgroundImage(nil, for: .selected)
                objc_setAssociatedObject(self, &selectedColorHandle, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}
