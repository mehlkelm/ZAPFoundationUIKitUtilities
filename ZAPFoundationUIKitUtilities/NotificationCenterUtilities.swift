//
//  NotificationCenterUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 13.11.18.
//  Copyright © 2018 Zozi Apps. All rights reserved.
//

import UIKit

extension NotificationCenter {
    
    var errorNotificationName: Notification.Name {
        return Notification.Name("ZAPErrorNotification")
    }
    
    public func postZAPError(object: Any?, description: String, error: Error? = nil, userInfo: [AnyHashable : Any]? = nil) {
        
        var info = userInfo ?? [AnyHashable: Any]()
        info["description"] = description
        info["error"] = error
        
        let notification = Notification(name: errorNotificationName, object: object, userInfo: info)
        print(notification)
        
        DispatchQueue.main.async {
            self.post(notification)
        }
    }
}
