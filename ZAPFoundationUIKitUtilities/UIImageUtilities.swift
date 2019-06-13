//
//  UIImageUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 03.06.19.
//  Copyright © 2019 Zozi Apps. All rights reserved.
//

import Foundation

extension UIImage {
    public class func imageWithColor(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 1.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}