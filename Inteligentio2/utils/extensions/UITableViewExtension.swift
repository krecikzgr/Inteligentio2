//
//  UITableViewExtension.swift
//  GSDMobileFramework
//
//  Created by Adrian Kaleta on 25/04/2017.
//  Copyright © 2017 GSD Software mbH. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(withClass `class`: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: `class`.defaultIdentifier()) as? T
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withClass `class`: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: `class`.defaultIdentifier(), for: indexPath as IndexPath) as? T else {
            fatalError("Error: cell with identifier: \(`class`.defaultIdentifier()) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
    public func register<T: UITableViewCell>(cellClass `class`: T.Type) {
        register(`class`, forCellReuseIdentifier: `class`.defaultIdentifier())
    }
    
    public func register<T: UITableViewCell>(nib: UINib, forClass `class`: T.Type) {
        register(nib, forCellReuseIdentifier: `class`.defaultIdentifier())
    }
}
