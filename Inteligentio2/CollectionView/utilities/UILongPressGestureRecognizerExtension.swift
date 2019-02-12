//
//  UILongPressGestureRecognizerExtension.swift
//  GenericCollectionView
//
//  Created by Adrian Kaleta on 22/01/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import UIKit

extension UILongPressGestureRecognizer {
    fileprivate struct AssociatedKeys {
        static var indexPath: IndexPath?
        static var targetConfigurator: SectionCellConfigurator?
    }

    public var indexPath: IndexPath? {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.indexPath) as? IndexPath else {
                return nil
            }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.indexPath, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var targetConfigurator: SectionCellConfigurator? {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.targetConfigurator) as? SectionCellConfigurator else {
                return nil
            }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.targetConfigurator, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
