//
//  UIViewControllerUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 09.01.19.
//  Copyright © 2019 Zozi Apps. All rights reserved.
//

import UIKit

extension UIViewController {
    @objc public func dismissAnimated() {
        self.dismiss(animated: true, completion: nil)
    }
}
