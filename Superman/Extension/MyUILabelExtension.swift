//
//  MyUILabelExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 19/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import UIKit
import Material

extension UILabel {
    func forTitleGrayBold() {
        self.font = RobotoFont.bold(with: 21)
        self.textColor = UIColor.kerryGray
    }
    
    func forTitleGrayNormal() {
        self.font = RobotoFont.regular(with: 21)
        self.textColor = UIColor.kerryGray
    }
    
    func forTitleGraySemiBold() {
        self.font = RobotoFont.medium(with: 21)
        self.textColor = UIColor.kerryGray
    }
    
    func forTitleBlackBold() {
        self.font = RobotoFont.bold(with: 21)
        self.textColor = UIColor.black
    }
    
    func forTitleBlackNormal() {
        self.font = RobotoFont.regular(with: 21)
        self.textColor = UIColor.black
    }
    
    func forTitleBlackSemiBold() {
        self.font = RobotoFont.medium(with: 21)
        self.textColor = UIColor.black
    }
    
    func forTitleWhiteBold() {
        self.font = RobotoFont.bold(with: 21)
        self.textColor = UIColor.white
    }
    
    func forTitleOrangeBold() {
        self.font = RobotoFont.bold(with: 21)
        self.textColor = UIColor.kerryOrange
    }
    
    func forTitleOrangeNormal() {
        self.font = RobotoFont.regular(with: 21)
        self.textColor = UIColor.kerryOrange
    }
    
    func forTitleOrangeSemiBold() {
        self.font = RobotoFont.medium(with: 21)
        self.textColor = UIColor.kerryOrange
    }
    
    func forMessageGrayBold() {
        self.font = RobotoFont.bold(with: 17)
        self.textColor = UIColor.kerryGray
    }
    
    func forMessageGraySemiBold() {
        self.font = RobotoFont.medium(with: 17)
        self.textColor = UIColor.kerryGray
    }
    
    func forMessageGrayNormal() {
        self.font = RobotoFont.regular(with: 17)
        self.textColor = UIColor.kerryGray
    }
    
    func forMessageLightGrayBold() {
        self.font = RobotoFont.bold(with: 17)
        self.textColor = UIColor.lightGray
    }
    
    func forMessageLightGraySemiBold() {
        self.font = RobotoFont.medium(with: 17)
        self.textColor = UIColor.lightGray
    }
    
    func forMessageLightGrayNormal() {
        self.font = RobotoFont.regular(with: 17)
        self.textColor = UIColor.lightGray
    }
    
    func forMessageBlackBold() {
        self.font = RobotoFont.bold(with: 17)
        self.textColor = UIColor.black
    }
    
    func forMessageBlackSemiBold() {
        self.font = RobotoFont.medium(with: 17)
        self.textColor = UIColor.black
    }
    
    func forMessageBlackNormal() {
        self.font = RobotoFont.regular(with: 17)
        self.textColor = UIColor.black
    }
    
    func forMessageOrangeBold() {
        self.font = RobotoFont.bold(with: 17)
        self.textColor = UIColor.kerryOrange
    }
    
    func forMessageOrangeSemiBold() {
        self.font = RobotoFont.medium(with: 17)
        self.textColor = UIColor.kerryOrange
    }
    
    func forMessageOrangeNormal() {
        self.font = RobotoFont.regular(with: 17)
        self.textColor = UIColor.kerryOrange
    }
    
    func forMessageWhiteBold() {
        self.font = RobotoFont.bold(with: 17)
        self.textColor = UIColor.white
    }
    
    func forMessageWhiteSemiBold() {
        self.font = RobotoFont.medium(with: 17)
        self.textColor = UIColor.white
    }
    
    func forMessageWhiteNormal() {
        self.font = RobotoFont.regular(with: 17)
        self.textColor = UIColor.white
    }
    
    func forDetailOrange() {
        self.font = RobotoFont.regular(with: 14)
        self.textColor = UIColor.kerryOrange
    }
    
    func forDetailGray() {
        self.font = RobotoFont.regular(with: 14)
        self.textColor = UIColor.kerryGray
    }
    
    func forDetailGraySemiBold() {
        self.font = RobotoFont.medium(with: 14)
        self.textColor = UIColor.kerryGray
    }
    
    func forDetailWhite() {
        self.font = RobotoFont.regular(with: 14)
        self.textColor = UIColor.white
    }
    
    func forDetailBlack() {
        self.font = RobotoFont.regular(with: 14)
        self.textColor = UIColor.black
    }
    
    func forDetailLightGray() {
        self.font = RobotoFont.regular(with: 14)
        self.textColor = UIColor.lightGray
    }
    
    func forDetailFlatWhite() {
        self.font = RobotoFont.regular(with: 14)
        self.textColor = UIColor.flatWhite
    }
    
    func forDetailFlatGray() {
        self.font = RobotoFont.regular(with: 14)
        self.textColor = UIColor.flatGray
    }
}

extension UILabel {
    
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
    
    private struct AssociatedKeys {
        static var padding = UIEdgeInsets()
    }
    
    func makeLabelTextPosition (sampleLabel :UILabel?, positionIdentifier : String) -> UILabel
    {
        let rect = sampleLabel!.textRect(forBounds: bounds, limitedToNumberOfLines: 0)
        
        switch positionIdentifier
        {
        case "VerticalAlignmentTop":
            sampleLabel!.frame = CGRect.init(x: bounds.origin.x+5,
                                             y: bounds.origin.y,
                                             width: rect.size.width,
                                             height: rect.size.height)
            break;
            
        case "VerticalAlignmentMiddle":
            sampleLabel!.frame = CGRect.init(x: bounds.origin.x+5,
                                             y: bounds.origin.y + (bounds.size.height - rect.size.height) / 2,
                                             width: rect.size.width,
                                             height: rect.size.height)
            break;
            
        case "VerticalAlignmentBottom":
            sampleLabel!.frame = CGRect.init(x: bounds.origin.x+5,
                                             y: bounds.origin.y + (bounds.size.height - rect.size.height),
                                             width: rect.size.width,
                                             height: rect.size.height)
            break;
            
        default:
            sampleLabel!.frame = bounds;
            break;
        }
        return sampleLabel!
        
    }
    
    public var padding: UIEdgeInsets? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    override open func draw(_ rect: CGRect) {
        if let insets = padding {
            self.drawText(in: rect.inset(by: insets))
        } else {
            self.drawText(in: rect)
        }
    }
    
    @IBInspectable
    var rotation: Int {
        get {
            return 0
        } set {
            let radians = CGFloat(CGFloat(Double.pi) * CGFloat(newValue) / CGFloat(180.0))
            self.transform = CGAffineTransform(rotationAngle: radians)
        }
    }
    
}
