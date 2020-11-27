//
//  ZAPError.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 13.06.19.
//  Copyright © 2019 Zozi Apps. All rights reserved.
//

import Foundation

public struct ZAPError: LocalizedError {
    public var message: String?
    
    public init(message: String?) {
        self.message = message
    }
    
    public var errorDescription: String? {
        get {
            return message ?? "UNKNOWN ZAP ERROR!"
        }
    }
    
    public var localizedDescription: String {
        return message ?? "UNKNOWN ZAP ERROR!"
    }
}
