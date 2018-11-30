//
//  Constants.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 5/4/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

let Defaults = UserDefaults.standard

struct Constants {

    struct SupportCodeType {
        static let types = [AVMetadataObject.ObjectType.upce,
                                  AVMetadataObject.ObjectType.code39,
                                  AVMetadataObject.ObjectType.code39Mod43,
                                  AVMetadataObject.ObjectType.code93,
                                  AVMetadataObject.ObjectType.code128,
                                  AVMetadataObject.ObjectType.ean8,
                                  AVMetadataObject.ObjectType.ean13,
                                  AVMetadataObject.ObjectType.aztec,
                                  AVMetadataObject.ObjectType.pdf417,
                                  AVMetadataObject.ObjectType.qr]
    }
    
}

extension Constants {

    struct Symbology {
        static let code128 = "CICode128BarcodeGenerator"
        static let pdf417 = "CIPDF417BarcodeGenerator"
        static let aztec = "CIAztecCodeGenerator"
        static let qr = "CIQRCodeGenerator"
    }
        
}
