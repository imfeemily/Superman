//
//  MyColorExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 19/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import UIKit



extension UIColor {
    static let kerryOrange = UIColor.init(hex: 0xF37021, alpha: 1.0)
    static let kerryGray   = UIColor.init(hex: 0x58595B, alpha: 1.0)
    static let placeholder = UIColor.init(hex: 0xC8C8C8, alpha: 1.0)
    static let textViewBorder = UIColor.init(hex: 0xE3E3E3, alpha: 1.0)
    
}

extension UIColor {
    
    convenience init(hex: UInt32, alpha: CGFloat) {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}

extension Data {
    var hexString: String {
        return map { String(format: "%02.2hhx", arguments: [$0]) }.joined()
    }
}
