//
//  UpdatableCell.swift
//  GenericCollectionView
//
//  Created by Adrian Kaleta on 16/01/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import UIKit


public protocol UpdatableCell {
    associatedtype AssociatedType
    func updateFor(item: AssociatedType)
}

open class CollectionCell<T>: UICollectionViewCell {

    fileprivate let constraintPriority: Float = 750

    fileprivate var widthConstraint: NSLayoutConstraint?
    fileprivate var heightConstraint: NSLayoutConstraint?

    var viewData: T?

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .white
        self.setup()
    }

    internal func setup(width: CGFloat) {
        self.widthConstraint?.constant = width
    }

    internal func setupHeight(height: CGFloat?) {
        guard let height = height else {
            if self.heightConstraint != nil {
                self.removeConstraint(self.heightConstraint!)
            }
            return
        }
        self.heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: height)
        self.heightConstraint?.priority = UILayoutPriority(rawValue: self.constraintPriority)
        self.addConstraint(self.heightConstraint!)
    }

    fileprivate func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 0)
        self.widthConstraint?.priority = UILayoutPriority(rawValue: self.constraintPriority)
        self.addConstraint(self.widthConstraint!)
        self.initialize()
    }

    //Interface
    open func initialize() {

    }

    open func updateFor(item: T) {

    }
}
