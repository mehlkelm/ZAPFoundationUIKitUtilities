//
//  DeviceUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 05.04.19.
//  Copyright © 2019 Zozi Apps. All rights reserved.
//

import Foundation

extension UIDevice {
    public var isSimulator: Bool {
        var isSim = false
        #if targetEnvironment(simulator)
        isSim = true
        #endif
        return isSim
    }
    
    @objc public var isPhone: Bool {
        return self.userInterfaceIdiom == .phone
    }
    
    public var isTablet: Bool {
        return self.userInterfaceIdiom == .pad
    }
}
