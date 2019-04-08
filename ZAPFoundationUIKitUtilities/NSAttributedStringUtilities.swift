//
//  NSAttributedStringUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 06.12.18.
//  Copyright © 2018 Zozi Apps. All rights reserved.
//

import Foundation

extension NSAttributedString {
    
    @objc public convenience init?(HTMLString: String?) {
        
        guard let string = HTMLString else {
            return nil
        }
        let data = Data(string.utf8)
        try? self.init(data: data, options: [ NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
    }
    
    @objc public func trailingNewlineChopped() -> NSAttributedString {
        
        if string.hasSuffix("\n") {
            return self.attributedSubstring(from: NSRange(location: 0, length: length - 1))
        } else {
            return self
        }
    }
}
