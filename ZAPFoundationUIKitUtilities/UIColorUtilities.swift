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
	
	convenience init(red: Int, green: Int, blue: Int) {
		
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")
		
		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
	}
	
	public convenience init(rgb: Int) {
		
		self.init(
			red: (rgb >> 16) & 0xFF,
			green: (rgb >> 8) & 0xFF,
			blue: rgb & 0xFF
		)
	}
    
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
