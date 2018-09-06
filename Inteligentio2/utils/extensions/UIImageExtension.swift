//
//  UIImageExtension.swift
//  KDA
//
//  Created by Adrian Kaleta on 26/03/2018.
//  Copyright © 2018 GSD. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {

    class func global(image: IconNames) -> UIImage {
        return UIImage(named: image.rawValue)?.withRenderingMode(.alwaysTemplate) ?? UIImage()
    }

    func imageWithInsets(insetDimen: CGFloat) -> UIImage {
        return imageWithInset(insets: UIEdgeInsets(top: insetDimen, left: insetDimen, bottom: insetDimen, right: insetDimen))
    }

    func imageWithInset(insets: UIEdgeInsets) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: self.size.width + insets.left + insets.right,
                   height: self.size.height + insets.top + insets.bottom), false, self.scale)
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageWithInsets!
    }

    func toData() -> Data? {
        guard let data = UIImageJPEGRepresentation(self, 1.0) else {
            return nil
        }
        return data
    }
}
