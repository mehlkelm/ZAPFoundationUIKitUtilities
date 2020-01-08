//
//  NSAttributedStringUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 06.12.18.
//  Copyright © 2018 Zozi Apps. All rights reserved.
//

import Foundation

extension NSAttributedString {
    
    @objc public convenience init?(HTMLString: String?, color: UIColor? = nil) {
        guard let string = HTMLString else {
            return nil
        }
        let data = Data(string.utf8)
        if let color = color, let mutable = NSMutableAttributedString(HTMLString: HTMLString) {
            mutable.setForegroundColor(color)
            self.init(attributedString: mutable)
        } else {
            try? self.init(data: data, options: [ NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
    }
    
    @objc public func trailingNewlineChopped() -> NSAttributedString {
        if string.hasSuffix("\n") {
            return self.attributedSubstring(from: NSRange(location: 0, length: length - 1))
        } else {
            return self
        }
    }
}

extension NSMutableAttributedString {
    
    @objc public func setForegroundColor(_ color: UIColor) {
        self.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: self.length))
    }
}

extension String {
    
    public var attributedHTMLString: NSMutableAttributedString? {
        let data = Data(self.utf8)
        do {
            let atString = try NSMutableAttributedString(data: data, options: [ NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            return atString
        } catch {
            print(error)
        }
        return nil
    }
}
