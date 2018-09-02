//
//  UITableViewCellExtension.swift
//  Inteligentio2
//
//  Created by Adrian on 02.09.2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import UIKit

public extension UITableViewCell {
    public class func defaultIdentifier() -> String {
        return NSStringFromClass(self)
    }
}
