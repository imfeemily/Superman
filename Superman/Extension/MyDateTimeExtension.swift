//
//  MyDateTimeExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 19/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import UIKit
import Localize

//MARK: - DATETIME
extension String {
    
    func toDate(currentFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.locale = NSLocale.init(localeIdentifier: "en_US_POSIX") as Locale?
        dateFormatter.dateFormat = currentFormat
        return dateFormatter.date(from: self)
    }
    
    func convertDateFormater(currentFormat: String, newFormat: String) -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = currentFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = newFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return  dateFormatter.string(from: date!)
        
        
    }
}

extension Double {
    
    func toCurrency() -> String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        let formattedStr: String = formatter.string(from: NSNumber(value: self))! as String
        
        return formattedStr
    }
    
    func convertUnixTime() -> String {
        let unixTimeDigit = String(self).count
        var unixTimeResult: Double = self
        if unixTimeDigit == 15 {
            unixTimeResult = self / 1000
        }
        let date = Date(timeIntervalSince1970: unixTimeResult)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+7:00")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
    func convertUnixTime(format: String) -> String {
        let unixTimeDigit = String(self).count
        var unixTimeResult: Double = self
        if unixTimeDigit == 15 {
            unixTimeResult = self / 1000
        }
        let date = Date(timeIntervalSince1970: unixTimeResult) // Time in second
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+7:00")
        dateFormatter.dateFormat = format
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}

extension Date {
    var aMonth: Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)!
    }
    var twoWeeks: Date {
        return Calendar.current.date(byAdding: .day, value: -14, to: self)!
    }
    var aWeek: Date {
        return Calendar.current.date(byAdding: .day, value: -7, to: self)!
    }
    var threeDay: Date {
        return Calendar.current.date(byAdding: .day, value: -3, to: self)!
    }
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
    
    func toStringFormat(format: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        dateFormatter.locale = Localize.currentLanguage == "en" ?  Locale(identifier: "en_US_POSIX") : Locale(identifier: "th_TH_POSIX")
        
        return  dateFormatter.string(from: self)
    }
}
