//
//  MyNotificationExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 19/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let resetBatch = Notification.Name("resetBatch")
    static let scanner = Notification.Name("receivedScanData")
    static let trackConsignment = Notification.Name("trackingConsignment")
    static let passMobileNumber = Notification.Name("passMobileNumber")
    static let viewNotification = Notification.Name("notificationView")
    static let shipFromHomeSelected = Notification.Name("shipFromHomeSelected")
    static let showBadgeShipFromHome = Notification.Name("showBadgeShipFromHome")
    static let removeBadgeShipFromHome = Notification.Name("removeBadgeShipFromHome")
    static let showBadheShipAtShop = Notification.Name("showBadgeShipAtShop")
    static let removeBadgeShipAtShop = Notification.Name("removeBadgeShipAtShop")
    static let viewLocationDetail = Notification.Name("viewLocationDetail")
    static let loadShipmentPendingHistory = Notification.Name("loadShipmentPendingHistory")
    static let loadShipmentSuccessHistory = Notification.Name("loadShipmentSuccessHistory")
    static let refreshSCLList = Notification.Name("scl.refreshList")
    static let refreshSCLMap = Notification.Name("scl.refreshMap")
    
}
