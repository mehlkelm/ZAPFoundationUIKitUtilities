//
//  ZAPCustomViewWithXib.swift
//  Feed Filter
//
//  Created by Stefan Pauwels on 08.02.17.
//
//

import UIKit

open class ZAPCustomViewWithXib: UIView {
    
    // Expose generic function this way for Objective-C
    public static func instantiate() -> Self {
        
        return self.instantiateSelf()
    }

    private static func instantiateSelf<T: UIView>() -> T {
        
        let bundle = Bundle(for: T.self)
        let views = bundle.loadNibNamed(String(describing: T.self), owner: nil, options: nil)
        let view = views?.first as! T
        return view
    }

    private init() {
        
        fatalError()
    }
    
    private override init(frame: CGRect) {
        
        fatalError()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}
