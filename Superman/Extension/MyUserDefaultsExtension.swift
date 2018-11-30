//
//  MyUserDefaultsExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 19/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func clearUserDefault() {
        self.set("", forKey: UserDefaultsKeys.userFullName)
        self.set("", forKey: UserDefaultsKeys.senderName)
        self.set("", forKey: UserDefaultsKeys.userMobileNumber)
        self.set("", forKey: UserDefaultsKeys.userAddress)
        self.set("", forKey: UserDefaultsKeys.userEmail)
        self.set("", forKey: UserDefaultsKeys.userGender)
        self.set("", forKey: UserDefaultsKeys.userProfileImage)
        self.set("", forKey: UserDefaultsKeys.userBirthDay)
        self.set("", forKey: UserDefaultsKeys.userMid)
        self.set(0, forKey: UserDefaultsKeys.badgeCounter)
        self.set(false, forKey: UserDefaultsKeys.isVerify)
        self.set(true, forKey: UserDefaultsKeys.isNotifications)
        self.set("", forKey: UserDefaultsKeys.userPoint)
        self.set(false, forKey: UserDefaultsKeys.isCODMember)
        self.synchronize()
        
    }
    
//    func initThaiLanguage(){
//        Localize.upda
//        let thai = createLocale().initWithLanguageCode(languageCode: "th", countryCode: "th", name: "Thai")
//        Language.setLanguage(withCode:thai)
//        self.synchronize()
//
//    }
//
//    func initEnglishLanguage(){
//        let english = createLocale().initWithLanguageCode(languageCode: "en", countryCode: "gb", name: "United Kingdom")
//        Language.setLanguage(withCode:english)
//        self.synchronize()
//    }
    
    func getBadge() -> Int {
        return self.integer(forKey: UserDefaultsKeys.badgeCounter)
    }
    
    func addBadge(badge: Int) {
        let current = self.integer(forKey: UserDefaultsKeys.badgeCounter)
        let sum = current + badge
        self.set(sum, forKey: UserDefaultsKeys.badgeCounter)
    }
    
    func clearBadge() {
        self.set(0, forKey: UserDefaultsKeys.badgeCounter)
    }
    
    func getHeaderToken() -> String {
        return "\(self.string(forKey: UserDefaultsKeys.tokenType) ?? "") \(self.string(forKey: UserDefaultsKeys.accessToken) ?? "")"
    }
    
    func getVerifyStatus() -> Bool {
        return self.bool(forKey: UserDefaultsKeys.isVerify)
    }
    
    func setVerifyStatus(status: Bool) {
        self.set(status, forKey: UserDefaultsKeys.isVerify)
    }
    
    func getTokenType() -> String {
        return self.string(forKey: UserDefaultsKeys.tokenType) ?? ""
    }
    
    func setTokenType(type: String) {
        self.set(type, forKey: UserDefaultsKeys.tokenType)
    }
    
    func getRefreshToken() -> String {
        return self.string(forKey: UserDefaultsKeys.refreshToken) ?? ""
    }
    
    func setRefreshToken(token: String) {
        self.set(token, forKey: UserDefaultsKeys.refreshToken)
    }
    
    func getAccessToken() -> String {
        return self.string(forKey: UserDefaultsKeys.accessToken) ?? ""
    }
    
    func setAccessToken(token: String) {
        self.set(token, forKey: UserDefaultsKeys.accessToken)
    }
    
    func getFcmToken() -> String {
        return self.string(forKey: UserDefaultsKeys.fcmToken) ?? ""
    }
    
    func setFcmToken(token: String) {
        self.set(token, forKey: UserDefaultsKeys.fcmToken)
    }
    
    func getUserMid() -> String {
        return self.string(forKey: UserDefaultsKeys.userMid) ?? ""
    }
    
    func setUserMid(mid: String) {
        self.set(mid, forKey: UserDefaultsKeys.userMid)
    }
    
    func getUserBirthDay() -> String {
        return self.string(forKey: UserDefaultsKeys.userBirthDay) ?? ""
    }
    
    func setUserBirthDay(birthDay: String) {
        self.set(birthDay, forKey: UserDefaultsKeys.userBirthDay)
    }
    
    func getUserProfileImage() -> String {
        return self.string(forKey: UserDefaultsKeys.userProfileImage) ?? ""
    }
    
    func setUserProfileImage(imageString: String) {
        self.set(imageString, forKey: UserDefaultsKeys.userProfileImage)
    }
    
    func getUserGender() -> String {
        return self.string(forKey: UserDefaultsKeys.userGender) ?? ""
    }
    
    func setUserGender(gender: String) {
        self.set(gender, forKey: UserDefaultsKeys.userGender)
    }
    
    func getUserEmail() -> String {
        return self.string(forKey: UserDefaultsKeys.userEmail) ?? ""
    }
    
    func setUserEmail(email: String) {
        self.set(email, forKey: UserDefaultsKeys.userEmail)
    }
    
    func getUserAddress() -> String {
        return self.string(forKey: UserDefaultsKeys.userAddress) ?? ""
    }
    
    func setUserAddress(address: String) {
        self.set(address, forKey: UserDefaultsKeys.userAddress)
    }
    
    func getUserMobileNumber() -> String {
        return self.string(forKey: UserDefaultsKeys.userMobileNumber) ?? ""
    }
    
    func setUserMobileNumber(mobile: String) {
        self.set(mobile, forKey: UserDefaultsKeys.userMobileNumber)
    }
    
    func getUserFullName() -> String {
        return self.string(forKey: UserDefaultsKeys.userFullName) ?? ""
    }
    
    func setUserFullName(name: String) {
        self.set(name, forKey: UserDefaultsKeys.userFullName)
    }
    
    func getSenderName() -> String {
        return self.string(forKey: UserDefaultsKeys.senderName) ?? ""
    }
    
    func setSenderName(name: String) {
        self.set(name, forKey: UserDefaultsKeys.senderName)
    }
    
    func getNotificationStatus() -> Bool {
        return self.bool(forKey: UserDefaultsKeys.isNotifications)
    }
    
    func setNotificationStatus(status: Bool) {
        self.set(status, forKey: UserDefaultsKeys.isNotifications)
    }
    
    func setUserPoint(point: String) {
        self.set(point, forKey: UserDefaultsKeys.userPoint)
    }
    
    func getUserPoint() -> String {
        return self.string(forKey: UserDefaultsKeys.userPoint) ?? "0"
    }
    
    func setCODAccountStatus(status: Bool) {
        self.set(status, forKey: UserDefaultsKeys.isCODMember)
    }
    
    func getCODAccountStatus() -> Bool {
        return self.bool(forKey: UserDefaultsKeys.isCODMember)
    }
}
