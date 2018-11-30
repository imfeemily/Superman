//
//  MyFontExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 21/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import UIKit
import Material

extension UIFont {
    
    private enum MyFont: String {
        case SFUIDisplayBold = "SFUIDisplay-Bold"
        case SFUITextLight = "SFUIText-Light"
        case SFUITextRegular = "SFUIText-Regular"
        case SFUIDisplayMedium = "SFUIDisplay-Medium"
    }
    
    private static let defaultFont = RobotoFont.regular(with: 17)
    
    static func printAllPossibleFonts() {
        UIFont.familyNames.sorted().forEach({
            UIFont.fontNames(forFamilyName: $0).sorted().forEach({
                print($0)
            })
        })
    }
    
    static func fontForNavigationBarTitle() -> UIFont {
        return RobotoFont.medium(with: 18)
    }
    
    static func fontForLargeNavigationBarTitle() -> UIFont {
        return RobotoFont.medium(with: 32)
    }
    
    static func fontForTitleRegular() -> UIFont {
        return RobotoFont.regular(with: 21)
    }
    
    static func fontForTitleSemiBold() -> UIFont {
        return RobotoFont.medium(with: 21)
    }
    
    static func fontForTitleBold() -> UIFont {
        return RobotoFont.bold(with: 21)
    }
    
    static func fontForMessageRegular() -> UIFont {
        return RobotoFont.regular(with: 17)
    }
    
    static func fontForMessageSemiBold() -> UIFont {
        return RobotoFont.medium(with: 17)
    }
    
    static func fontForMessageBold() -> UIFont {
        return RobotoFont.bold(with: 17)
    }
    
    static func fontForDateTimeRegular() -> UIFont {
        return RobotoFont.regular(with: 14)
    }
    
    static func fontForDateTimeThin() -> UIFont {
        return RobotoFont.light(with: 14)
    }
    
    static func fontForDateTimeSemiBold() -> UIFont {
        return RobotoFont.medium(with: 14)
    }
    
    static func fontForButton() -> UIFont {
        return RobotoFont.bold(with: 18)
    }
    
    static func fontForMiniButton() -> UIFont {
        return RobotoFont.medium(with: 15)
    }
    
    static func fontForTinyButton() -> UIFont {
        return RobotoFont.regular(with: 12)
    }
    
}
