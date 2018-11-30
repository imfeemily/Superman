//
//  MyUIImageExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 19/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import UIKit

public enum ImageFormat {
    case png
    case jpeg(CGFloat)
}

extension UIApplication {
    
    var snapshot: UIImage? {
        return keyWindow?.rootViewController?.view.snapshot
    }
}

extension UIImage {
    
    convenience init(view: UIView) {
        if let cgImage = view.snapshot?.cgImage {
            self.init(cgImage: cgImage)
        } else {
            self.init()
        }
    }
    
    enum CompressImageErrors: Error {
        case invalidExSize
        case sizeImpossibleToReach
    }
    
    func compressImage(_ expectedSizeKb: Int, completion : (UIImage,CGFloat) -> Void ) throws {
        
        let minimalCompressRate :CGFloat = 0.4 // min compressRate to be checked later
        
        if expectedSizeKb == 0 {
            throw CompressImageErrors.invalidExSize // if the size is equal to zero throws
        }
        
        let expectedSizeBytes = expectedSizeKb * 1024
        let imageToBeHandled: UIImage = self
        var actualHeight : CGFloat = self.size.height
        var actualWidth : CGFloat = self.size.width
        var maxHeight : CGFloat = 841 //A4 default size I'm thinking about a document
        var maxWidth : CGFloat = 594
        var imgRatio : CGFloat = actualWidth/actualHeight
        let maxRatio : CGFloat = maxWidth/maxHeight
        var compressionQuality : CGFloat = 1
        var imageData:Data = imageToBeHandled.jpegData(compressionQuality: compressionQuality)!
        while imageData.count > expectedSizeBytes {
            
            if (actualHeight > maxHeight || actualWidth > maxWidth){
                if(imgRatio < maxRatio){
                    imgRatio = maxHeight / actualHeight;
                    actualWidth = imgRatio * actualWidth;
                    actualHeight = maxHeight;
                }
                else if(imgRatio > maxRatio){
                    imgRatio = maxWidth / actualWidth;
                    actualHeight = imgRatio * actualHeight;
                    actualWidth = maxWidth;
                }
                else{
                    actualHeight = maxHeight;
                    actualWidth = maxWidth;
                    compressionQuality = 1;
                }
            }
            let rect = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
            UIGraphicsBeginImageContext(rect.size);
            imageToBeHandled.draw(in: rect)
            let img = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            if let imgData = img!.jpegData(compressionQuality: compressionQuality) {
                if imgData.count > expectedSizeBytes {
                    if compressionQuality > minimalCompressRate {
                        compressionQuality -= 0.1
                    } else {
                        maxHeight = maxHeight * 0.9
                        maxWidth = maxWidth * 0.9
                    }
                }
                imageData = imgData
            }
            
            
        }
        
        completion(UIImage(data: imageData)!, compressionQuality)
    }
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ quality: JPEGQuality) -> Data? {
        return self.jpegData(compressionQuality: quality.rawValue)
    }
    
    class func scaleImageToSize(img: UIImage, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        
        img.draw(in: CGRect(origin: CGPoint.zero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return scaledImage!
    }
    
    class func convertImageToBase64(image: UIImage) -> String {
      
        let imageData = image.jpegData(compressionQuality: 1)!
        return imageData.base64EncodedString()
    }
    
    class func base64(image: UIImage,format: ImageFormat) -> String? {
        var imageData: Data?
        switch format {
        case .png: imageData = image.pngData()
        case .jpeg(let compression): imageData = image.jpegData(compressionQuality: compression)
        }
        return imageData?.base64EncodedString()
    }
    
    
    class func dottedLine(radius: CGFloat, space: CGFloat, numberOfPattern: CGFloat) -> UIImage {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: radius/2, y: radius/2))
        path.addLine(to: CGPoint(x: (numberOfPattern)*(space+1)*radius, y: radius/2))
        path.lineWidth = radius
        
        let dashes: [CGFloat] = [path.lineWidth * 0, path.lineWidth * (space+1)]
        path.setLineDash(dashes, count: dashes.count, phase: 0)
        path.lineCapStyle = CGLineCap.round
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: (numberOfPattern)*(space+1)*radius, height: radius), false, 1)
        
        UIColor.white.setStroke()
        path.stroke()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
        
    }
    
    func imageWithColor(color1: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color1.setFill()
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    
}
