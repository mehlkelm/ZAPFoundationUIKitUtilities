//
//  UIBarButtonItemUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 15.12.18.
//  Copyright © 2018 Zozi Apps. All rights reserved.
//

import Foundation

extension UIBarButtonItem {
    
    public static func emptyBarButtonItem() -> UIBarButtonItem {
        
        return UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
