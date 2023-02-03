//
//  UIColorUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 08.06.19.
//  Copyright © 2019 Zozi Apps. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    public var css: String {
        
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return NSString(format:"#%06x", rgb) as String
    }
    
    private static func *(left: UIColor, right: CGFloat) -> UIColor {
        
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        left.getRed(&r, green: &g, blue: &b, alpha: &a)
        let newColor = UIColor(red: r * right, green: g * right, blue: b * right, alpha: a)
        return newColor
    }
}
