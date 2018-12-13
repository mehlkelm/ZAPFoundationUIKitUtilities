//
//  BundleUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 13.12.18.
//  Copyright © 2018 Zozi Apps. All rights reserved.
//

import UIKit

extension Bundle {
    public var isExtension: Bool {
        return self.bundlePath.hasSuffix(".appex")
    }
}
