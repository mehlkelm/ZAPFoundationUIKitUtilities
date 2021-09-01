//
//  ZAPClickableTableViewTextView.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 15.11.19.
//  Copyright © 2019 Zozi Apps. All rights reserved.
//

import UIKit

public class ZAPClickableTableViewTextView: UITextView, UITextViewDelegate {
    
    /* https://medium.com/@sdrzn/swifty-approach-to-handling-uitextviews-with-links-in-cells-d89e0e4b83d1 */
    
    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        // location of the tap
        var location = point
        location.x -= self.textContainerInset.left
        location.y -= self.textContainerInset.top
        
        // find the character that's been tapped
        let characterIndex = self.layoutManager.characterIndex(for: location, in: self.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        if characterIndex < self.textStorage.length {
            // if the character is a link, handle the tap as UITextView normally would
            if (self.textStorage.attribute(NSAttributedString.Key.link, at: characterIndex, effectiveRange: nil) != nil) {
                return self
            }
        }
        
        // otherwise return nil so the tap goes on to the next receiver
        return nil
    }
}
