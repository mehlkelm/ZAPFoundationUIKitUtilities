//
//  NSAttributedStringUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 06.12.18.
//  Copyright © 2018 Zozi Apps. All rights reserved.
//

import Foundation

extension NSAttributedString {
        
    @objc public func trailingNewlineChopped() -> NSAttributedString {
        if string.hasSuffix("\n") {
            return self.attributedSubstring(from: NSRange(location: 0, length: length - 1))
        } else {
            return self
        }
    }
}

extension NSString {
    
    @objc public func convertHTMLToAttributedString(color: UIColor? = nil) -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf8.rawValue) else { return nil }
        return data.convertHTMLToAttributedString(colored: color)
    }
}

extension String {
    
    public func convertHTMLToAttributedString(colored: UIColor? = nil) -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf8) else { return nil }
        return data.convertHTMLToAttributedString(colored: colored)
    }
}

extension Data {
    
    public func convertHTMLToAttributedString(colored: UIColor? = nil) -> NSAttributedString? {
        do {
            // Intermittent crashes remain… see https://developer.apple.com/forums/thread/115405
            let mutableAS = try NSMutableAttributedString(data: self,
                                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                                          documentAttributes: nil)
            if let color = colored {
                mutableAS.setForegroundColor(color)
            }
            return NSAttributedString(attributedString: mutableAS)
        } catch {
            print(error)
            return nil
        }
    }
}

extension NSMutableAttributedString {
    
    @objc public func setForegroundColor(_ color: UIColor) {
        self.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: self.length))
    }
}
