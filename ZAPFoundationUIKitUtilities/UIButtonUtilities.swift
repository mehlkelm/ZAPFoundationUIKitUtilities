//
//  UIButtonUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 06.06.19.
//  Copyright © 2019 Zozi Apps. All rights reserved.
//

import UIKit

@IBDesignable extension UIButton {
        
    @IBInspectable var backgroundImageOfColor: UIColor? {
        set {
            // HACK: We need to save the background image color somewhere to be able to provide a getter. I figured I will never need a layer.borderColor when using a background color image and it will not be displayed unless layer.borderWidth > 0, so we just use layer.borderColor to save the color. 😬
            layer.borderColor = newValue?.cgColor
            if let color = newValue {
                setBackgroundImage(UIImage.imageWithColor(color), for: .normal)
            } else {
                setBackgroundImage(nil, for: .normal)
            }
        }
        get {
            if let color = layer.backgroundColor {
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
