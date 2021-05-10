//
//  UIStoryboardSegueUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 10.05.21.
//  Copyright © 2021 Zozi Apps. All rights reserved.
//

import Foundation

extension UIStoryboardSegue {
    public func findDestinationViewController<T>(ofType: T.Type) -> T? {
        if let t = destination as? T {
            return t
        }
        if let nav = destination as? UINavigationController {
            if let t = nav.children.first as? T {
                return t
            }
        }
        return nil
    }
}
