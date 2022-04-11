//
//  UIViewControllerUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 09.01.19.
//  Copyright © 2019 Zozi Apps. All rights reserved.
//

import UIKit

extension UIViewController {
    
    @objc public func dismissAnimated(completion: (() -> Void)? = nil) {
        
        self.dismiss(animated: true, completion: completion)
    }
    
    public func alert(title: String?, message: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { action in
            alert.dismiss(animated: true)
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
