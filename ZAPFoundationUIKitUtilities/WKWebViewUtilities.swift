//
//  WKWebViewUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 15.12.18.
//  Copyright © 2018 Zozi Apps. All rights reserved.
//

import Foundation
import WebKit

extension WKWebView {
    
    public func loadHTMLRessource(name filename: String, bundle: Bundle = Bundle.main) {
        
        let base = URL(fileURLWithPath:Bundle.main.bundlePath, isDirectory: true)
        if let path = bundle.path(forResource: filename, ofType: "html"),
            let content = try? String(contentsOfFile: path) {
            //content = content.replacingOccurrences(of: "$STYLETAG", with: AppearanceCoordinator.htmlStyleTag())
            loadHTMLString(content, baseURL: base)
        } else {
            print("COULD NOT LOAD RESSOURCE \(filename)")
        }
    }
}

