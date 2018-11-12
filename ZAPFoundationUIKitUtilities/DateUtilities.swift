//
//  DateUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 11.11.18.
//  Copyright © 2018 Zozi Apps. All rights reserved.
//

import Foundation

extension Date {
    
    static var secondsInADay: TimeInterval = 24 * 60 * 60
    
    public static func daysAgo(_ days: Double) -> Date {
        return Date(timeIntervalSinceNow: -days * secondsInADay)
    }
    
    public static func daysAgo(_ days: Int) -> Date {
        return daysAgo(Double(days))
    }
}
