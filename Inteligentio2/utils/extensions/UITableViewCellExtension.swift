//
//  UITableViewCellExtension.swift
//  GSDMobileFramework
//
//  Created by Adrian Kaleta on 20/04/2017.
//  Copyright © 2017 GSD Software mbH. All rights reserved.
//

import Foundation
import UIKit

public extension UITableViewCell {
    public class func defaultIdentifier() -> String {
        return NSStringFromClass(self)
    }

}
