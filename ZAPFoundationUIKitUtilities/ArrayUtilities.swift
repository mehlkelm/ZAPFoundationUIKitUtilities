//
//  ArrayUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 08.09.19.
//  Copyright © 2019 Zozi Apps. All rights reserved.
//

import Foundation

extension Array {
    
    public func chunks(with size: Int) -> [[Element]] {
        
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
    
    public func chunks(_ number: Int) -> [[Element]] {
        
        let size: Int = Int(ceil(Double(count) / Double(number)))
        return chunks(with: size)
    }
    
    public func dividedInTwo(after number: Int) -> (batch: [Element], rest: [Element]) {
        
        guard number > 0 else {
            return ([], self)
        }
        guard number < count else {
            return (self, [])
        }
        let batch = Array(self[0..<number])
        let rest = Array(self[number..<count])
        return (batch, rest)
    }
}
