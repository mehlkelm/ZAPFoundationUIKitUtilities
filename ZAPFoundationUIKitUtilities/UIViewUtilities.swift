//
//  UIViewUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 19.01.21.
//  Copyright © 2021 Zozi Apps. All rights reserved.
//

import UIKit

extension UIView {
    
    public static func instatiate<T: UIView>(type: T) -> T {
        
        let bundle = Bundle(for: T.self)
        let views = bundle.loadNibNamed(String(describing: T.self), owner: nil, options: nil)
        let view = views?.first as! T
        return view
    }

    public static func instatiate(nibName: String) -> UIView {
        
        let views = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)
        let view = views?.first as! UIView
        return view
    }
}
