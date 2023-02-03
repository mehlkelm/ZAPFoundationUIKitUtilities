//
//  UIViewUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 19.01.21.
//  Copyright © 2021 Zozi Apps. All rights reserved.
//

import UIKit

public extension UIView {
    
    // Expose generic function this way for Objective-C
    static func instantiate() -> Self {
        
        return self.instantiateSelf()
    }

    static func instantiateSelf<T: UIView>() -> T {
        
        let bundle = Bundle(for: T.self)
        let views = bundle.loadNibNamed(String(describing: T.self), owner: nil, options: nil)
        let view = views?.first as! T
        return view
    }
        
    static func instantiate<T: UIView>(type: T) -> T {
        
        let bundle = Bundle(for: T.self)
        let views = bundle.loadNibNamed(String(describing: T.self), owner: nil, options: nil)
        let view = views?.first as! T
        return view
    }

    static func instantiate(nibName: String) -> UIView {
        
        let views = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)
        let view = views?.first as! UIView
        return view
    }
}
