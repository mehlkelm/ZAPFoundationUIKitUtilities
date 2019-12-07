//  UITableViewExtension.swift
//  Feed Filter
//
//  Created by Stefan Pauwels on 18.02.17.
//
//

import Foundation

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
}
