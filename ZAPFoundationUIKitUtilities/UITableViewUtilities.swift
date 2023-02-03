//  UITableViewExtension.swift
//  Feed Filter
//
//  Created by Stefan Pauwels on 18.02.17.
//
//

import Foundation
import UIKit

extension UITableView {
    
    public func registerNib<T: UITableViewCell>(for type: T.Type, bundle: Bundle? = nil) {
        
        let className = String(describing: type)
        let nib = UINib(nibName: className, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: className)
    }
    
    public func dequeueCell<T: UITableViewCell>(for type: T.Type, indexPath: IndexPath) -> T? {
        
        let className = String(describing: type)
        let cell = self.dequeueReusableCell(withIdentifier: className, for: indexPath)
        return cell as? T
    }
    
    public func indexPathBefore(_ indexPath: IndexPath) -> IndexPath? {
        
        var prevIndexPath: IndexPath?
        
        if indexPath.row > 0 {
            prevIndexPath = IndexPath(row: indexPath.row - 1, section: indexPath.section)
        } else {
            var prevSection = indexPath.section - 1
            while prevIndexPath == nil, prevSection >= 0 {
                let rowCount = numberOfRows(inSection: prevSection)
                if rowCount > 0 {
                    prevIndexPath = IndexPath(row: rowCount - 1, section: prevSection)
                }
                prevSection -= 1
            }
        }
        return prevIndexPath
    }
    
    public func indexPathAfter(_ indexPath: IndexPath) -> IndexPath? {
        
        guard numberOfSections > indexPath.section else {
            return nil
        }

        var nextIndexPath: IndexPath?
        
        if numberOfRows(inSection: indexPath.section) > indexPath.row + 1 {
            nextIndexPath = IndexPath(row: indexPath.row + 1, section: indexPath.section)
        } else {
            var nextSection = indexPath.section + 1
            while numberOfSections > nextSection {
                if numberOfRows(inSection: nextSection) > 0 {
                    nextIndexPath = IndexPath(row: 0, section: nextSection)
                }
                nextSection += 1
            }
        }
        return nextIndexPath
    }
}
