//
//  ZAPError.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 13.06.19.
//  Copyright © 2019 Zozi Apps. All rights reserved.
//

import Foundation

struct ZAPError: Error {
    var message: String?
    var localizedDescription: String {
        return message ?? "UNKNOWN ZAP ERROR!"
    }
}
