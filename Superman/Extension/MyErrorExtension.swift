//
//  MyErrorExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 19/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation

extension NSError {
    
    func getErrorMessage() -> String {
        switch self.code {
        case 200:
            return "Success"
        case 404:
            return "Not Found"
        case 500:
            return "Internal Server Error"
        default:
            return "Network Error"
        }
    }
}
