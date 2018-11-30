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
    
    
    // APPLICATION
    struct App {
        
        // Key
        struct Key {
            static let ZenDeskKey = "YppI2IYjT2fvy6NaIjrGTL1fmCrDDijI"
            static let GoogleServiceKey = "AIzaSyCj4mSsZPky7okhyOfobkiwsiWLzOmthYA"
            static let GoogleAPIsKey = "AIzaSyBdVl-cTICSwYKrZ95SuvNw7dbMuDt1KG0"
            static let gcmMessageIDKey = "gcm.message_id"
            static let gcmNotification = "gcm.notification.message"
        }
        
        #if DEBUG // -> Development
        
        static let BaseAPIURL = "https://crm.th.kerryexpress.com/keapp-api/"
        
        #else // -> Production
        
        static let BaseAPIURL = "https://crm.th.kerryexpress.com/keapp-api/"
        
        #endif
        
        struct URLs {
            static let EasyShip = "https://cms.th.kerryexpress.com/easyship"
            static let Tracking = "https://th.rnds.kerryexpress.com/KPT/History/Detail/"
        }
        
        static let appVersionName = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        static let deviceID = UIDevice.current.identifierForVendor!.uuidString
        
    }
    
    
    // MARK:
    // MARK: KeyAPI
    struct APIKey {
        static let appKey = "128d18ef54dc4f40bee110b403d6154e"
        static let appID  = "keapp"
    }
    
}

struct UserDefaultsKeys {
    
    // App default
    static let fcmToken = "fcmToken"
    static let accessToken = "accessToken"
    static let refreshToken = "refreshToken"
    static let tokenType = "tokenType"
    static let APP_OPENED_COUNT = "APP_OPENED_COUNT"
    static let MESSAGE_COUNT = "MESSAGE_COUNT"
    // User default
    static let userFullName = "defaultName"
    static let senderName = "senderName"
    static let userMobileNumber = "defaultMobile"
    static let userAddress = "defaultAddress"
    static let userEmail = "defaultEmail"
    static let userGender = "defaultGender"
    static let userProfileImage = "defaultPicture"
    static let userBirthDay = "userBirthday"
    static let userMid = "defaultMid"
    static let badgeCounter = "badgeCounter"
    static let isVerify = "isVerify"
    static let isNotifications = "isNotifications"
    static let userPoint = "point"
    static let isCODMember = "isCODMember"
    
}

extension String {
    static let appID = "id909585896"
    static let capitalLetterCharacterSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    static let lowerLetterCharacterSet = "abcdefghijklmnopqrstuvwxyz"
    static let spaceCharacterSet = " "
    static let symbolCharacterSet = "~`!@#$%^&*()+=-/;:\"\'{}[]<>^?, "
    static let emailCharacterSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.@"
    static let mobileCharacterSet = "0123456789-"
    static let decimalCharacterSet = "0123456789"
    static let trackingCharacterSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#"
}

extension Constants {
    
    struct NotificationID {
        static let message = "message"
        static let consignments = "dropoff.consignments"
        static let batchNumber = "dropoff.batchNumber"
       
    }
    
    struct cellID {
        static let cellId = "cell"
        static let headerCell = "headerCell"
        static let footerCell = "footerCell"
        static let shipAtShop = "cellShipAtShop"
        static let shipFromHome = "cellShipFromHome"
        static let trackInProgress = "trackInProgress"
        static let trackComplete = "trackComplete"
        static let trackSCL = "trackSCL"
        static let cellServices = "cellServices"
        static let normalFAQcell = "normalFAQcell"
        static let imageFAQcell = "imageFAQcell"
    }
    
    struct Topics {
        // Topics
        static let kerryAnnounce = "KerryAnnouncement"
        static let KEAppTH = "KEAppTH"
        static let KEAppEN = "KEAppEN"
        static let iOSDevices = "KEiOSDevices"
    }
    
    struct StoryboardId {
        static let selectServices = "selectServices"
        static let signIn = "SignIn"
        static let trackingHistory = "trackingHistory"
        static let register = "Register"
        static let getOTP = "GetOTP"
        static let createPassword = "CreatePassword"
        static let getOTPForgotPassword = "GetOTPForgotPassword"
        static let forgotPassword = "ForgotPassword"
        static let resetPassword = "ResetPassword"
        static let booking = "Booking"
        static let bookShipAtShop = "BookShipAtShop"
        static let bookShipFromHome = "BookShipFromHome"
        static let normalService = "NormalService"
        static let SCLService = "SCLService"
        static let SCLSelectLocation = "SelectSCLLocation"
        static let submitSummary = "SubmitSummary"
        static let qrcodeView = "QRCodeView"
        static let showMyBooking = "showMyBooking"
        static let bookingDetailView = "bookingDetailView"
        static let receiptTracking = "receiptTracking"
        static let trackConsignment = "trackConsignment"
        static let trackFromReceipt = "trackFromReceipt"
        static let trackFromHistory = "trackFromHistory"
        static let locationMap = "locationMap"
        static let locationList = "locationList"
        static let serviceLocation = "serviceLocation"
        static let membership = "membership"
        static let myProfile = "myProfile"
        static let termsAndCons = "termsAndCons"
        static let pointTransaction = "pointTransaction"
        static let priceEstimation = "priceEstimation"
        static let selectProvince = "selectProvince"
        static let getPrice = "getPrice"
        static let settings = "settings"
        static let changePassword = "changePassword"
        static let selectLanguage = "selectLanguage"
        static let notificationCenter = "notificationCenter"
        static let openAbout = "openAbout"
        static let openSafari = "openSafari"
        static let openGuildlines = "openGuildlines"
        static let openHowTo = "openHowto"
        static let openWhatIsSCL = "openWhatIsSCL"
        static let openFAQ = "openFAQ"
        static let openSettings = "openSettings"
        static let openNotifications = "openNotifications"
        static let showNotificationDetail = "showNotificationDetail"
        static let sclInProgress = "SCLInProgress"
        static let sclCollected = "SCLCollected"
        static let sclServices = "sclServices"
        static let inputOTP = "inputOTP"
        static let verifyMobileOTP = "getVerifyOTP"
        static let doVerifyMobile = "verifyMobile"
        static let showLocationDetail = "showLocationDetail"
        //Unwind
        static let unwindToInProgress = "unwindToInProgress"
        static let unwindBookingComplete = "onBookingComplete"
        static let unwindToQRCode = "unwindToQRCode"
        static let unwindServiceSelected = "onServiceSelected"
        static let unwindToSelfCollectionFromList = "onSelectSelfCollection"
        static let unwindToSelfCollectionFromMap = "onSelectSelfCollectionMap"
        static let unwindToSelectProvince = "onSelectProvince"
        static let unwindToVerifyEmail = "onVerifyEmail"
        static let unwindToSelectShipAtShop = "selectShipAtShop"
        static let unwindToSelectShipFromHome = "selectShipFromHome"
    }
    
    struct Symbology {
        static let code128 = "CICode128BarcodeGenerator"
        static let pdf417 = "CIPDF417BarcodeGenerator"
        static let aztec = "CIAztecCodeGenerator"
        static let qr = "CIQRCodeGenerator"
    }
        
}
