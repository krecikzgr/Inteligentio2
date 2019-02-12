//
//  UICollectionReusableView.swift
//  GSDMobileFramework
//
//  Created by Adrian Kaleta on 18/01/2019.
//  Copyright © 2019 GSD Software mbH. All rights reserved.
//

import UIKit

extension UICollectionReusableView {
    open class func reusableIdentifier() -> String {
        return String(describing: self)
    }
}

