//
//  UISplitViewControllerUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 05.01.20.
//  Copyright © 2020 Zozi Apps. All rights reserved.
//

import UIKit

extension UISplitViewController {
    
    public var masterNavigationController: UINavigationController? {
        
        viewControllers.first as? UINavigationController
    }
}
