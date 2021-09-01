//
//  DateUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 11.11.18.
//  Copyright © 2018 Zozi Apps. All rights reserved.
//

import Foundation

extension Date {
    
    public static func daysAgo(_ days: Double) -> Date {
        
        return Date(timeIntervalSinceNow: -days * TimeInterval.day)
    }
    
    public static func daysAgo(_ days: Int) -> Date {
        
        return daysAgo(Double(days))
    }
}

extension TimeInterval {
    
    public static var day: TimeInterval = 24 * 60 * 60
    public static var week: TimeInterval = day * 7
    public static var month: TimeInterval = day * 30
    public static var year: TimeInterval = day * 365
}
