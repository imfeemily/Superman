//
//  MyStringExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 19/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var isAlphanumeric: Bool {
        return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && self != ""
    }
    
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil && self != ""
    }
}

extension NSAttributedString {
    convenience init(text: String, aligment: NSTextAlignment) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = aligment
        self.init(string: text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
}


extension String {
    
    func generateQRCode() -> UIImage? {
        let data = self.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: Constants.Symbology.qr) {
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue("M", forKey: "inputCorrectionLevel")
            let transform = CGAffineTransform(scaleX: 200, y: 200)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    func generateBarCode() -> UIImage? {
        let data = self.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: Constants.Symbology.code128) {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    func convertBase64ToImage() -> UIImage {
        let imageData = Data(base64Encoded: self, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }
    
    func attributedString(aligment: NSTextAlignment) -> NSAttributedString {
        return NSAttributedString(text: self, aligment: aligment)
    }
    
    var hasOnlyNewlineSymbols: Bool {
        return trimmingCharacters(in: CharacterSet.newlines).isEmpty
    }
    
    
    func CitizenIDFormatForEdit() -> String {
        //x-xxxx-xxxxx-xx-x
        var mString = self
        if mString.count == 0{
            mString = mString.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        }
        
        if mString.count == 2{
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 1))
            mString = mString.replacingOccurrences(of: "--", with: "", options: .literal, range: nil)
        }
        
        if mString.count == 7{
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 6))
            mString = mString.replacingOccurrences(of: "--", with: "", options: .literal, range: nil)
        }
        
        if mString.count == 13{
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 12))
            mString = mString.replacingOccurrences(of: "--", with: "", options: .literal, range: nil)
        }
        
        if mString.count == 16{
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 15))
            mString = mString.replacingOccurrences(of: "--", with: "", options: .literal, range: nil)
        }
        
        return mString
    }
    
    func MobileFormatForEdit() -> String {
        //xxx-xxx-xxxx
        var mString = self
        
        if mString.count == 0{
            mString = mString.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        }
        
        if mString.count == 4{
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 3))
            mString = mString.replacingOccurrences(of: "--", with: "", options: .literal, range: nil)
        }
        
        if mString.count == 8{
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 7))
            mString = mString.replacingOccurrences(of: "--", with: "", options: .literal, range: nil)
        }
        
        return mString
    }
    
    
    func CitizenIDFormat() -> String {
        //x-xxxx-xxxxx-xx-x
        var mString = self
        
        mString = mString.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        mString = mString.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        
        if mString.count == 13{
            
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 1))
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 6))
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 12))
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 15))
            
        }
        
        return mString
    }
    
    func MobileFormat() -> String {
        //xxx-xxx-xxxx
        var mString = self
        
        mString = mString.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        mString = mString.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        
        if mString.count == 10{
            
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 3))
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 7))
            
        }
        
        return mString
    }
    
    func CitizenIDFormatHiding() -> String {
        //y-yyyy-xxxxx-xx-y
        var mString = self
        
        mString = mString.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        mString = mString.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        
        if mString.count == 13{
            
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 1))
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 6))
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 12))
            mString.insert("-", at: mString.index(mString.startIndex, offsetBy: 15))
            
            var result = String()
            var i = 0
            for char in mString {
                if i == 7 || i == 8 || i == 9 || i == 10 || i == 11 || i == 13 || i == 14{
                    let temp: Character = "x"
                    result.append(temp)
                } else {
                    result.append(char)
                }
                i+=1
            }
            return result
        }
        
        return ""
        
    }
    
    func MobileFormatHiding() -> String {
        //yyy yyy yyxx
        var mString = self
        mString = mString.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        mString = mString.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        
        if mString.count == 10{
            
            mString.insert(" ", at: mString.index(mString.startIndex, offsetBy: 3))
            mString.insert(" ", at: mString.index(mString.startIndex, offsetBy: 7))
            
            var result = String()
            var i = 0
            for char in mString {
                if  i == 4 ||
                    i == 5 ||
                    i == 6 ||
                    i == 8 ||
                    i == 9 {
                    let temp: Character = "x"
                    result.append(temp)
                } else {
                    result.append(char)
                }
                i+=1
            }
            
            return result
            
        }
        
        return ""
    }
    
}


