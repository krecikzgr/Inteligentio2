//
//  UIViewExtension.swift
//  Inteligentio2
//
//  Created by Adrian on 02.09.2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {

        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }

    func add(child: UIView, configuration: PlacementMargins) {
        self.addSubview(child)
        ConstraintBuilder.placeInSuperview(parent: self, child: child, placement: configuration)
    }

    func pinToSuperViewTop(spacing: CGFloat) {
        guard let superview = self.superview else {
            return
        }
        superview.addConstraint(ConstraintBuilder.pinElementToTopOfSuperView(spacing, view: self, parentView: superview))
    }

    func pinToSuperviewBottom(spacing: CGFloat) {
        guard let superview = self.superview else {
            return
        }
        superview.addConstraint(ConstraintBuilder.pinElementToBotomOfSuperView(spacing, view: self, parentView: superview))
    }

    func pinToSuperviewRight(spacing: CGFloat) {
        guard let superview = self.superview else {
            return
        }
        superview.addConstraint(ConstraintBuilder.pinElementToRightSideOfSuperView(spacing, view: self, parentView: superview))
    }

    func pinToSuperviewLeft(spacing: CGFloat) {
        guard let superview = self.superview else {
            return
        }
        superview.addConstraint(ConstraintBuilder.pinElementToLeftSideOfSuperView(spacing, view: self, parentView: superview))
    }

    func pinTo(upperView: UIView, spacing: CGFloat) {
        self.superview?.addConstraint(ConstraintBuilder.pinElementToUpperView(spacing, view: self, upperView: upperView))
    }

    func pinTo(viewOnRight: UIView, spacing: CGFloat) {
        self.superview?.addConstraint(ConstraintBuilder.pinElementToLeftSideOfView(spacing, view: viewOnRight, anotherView: self))
    }

    func pinTo(viewOnLeft: UIView, spacing: CGFloat) {
        self.superview?.addConstraint(ConstraintBuilder.pinElementToLeftSideOfView(spacing, view: self, anotherView: viewOnLeft))
    }

    func alignIn(x: CGFloat) {
        guard let superview = self.superview else {
            return
        }
        self.superview?.addConstraint(ConstraintBuilder.pinElementInTheMiddleXPosition(x, view: self, parentView: superview))
    }

    func alignIn(y: CGFloat) {
        guard let superview = self.superview else {
            return
        }
        self.superview?.addConstraint(ConstraintBuilder.pinElementInTheMiddleYPosition(y, view: self, parentView: superview))
    }

    func set(width: CGFloat) {
        self.superview?.addConstraint(ConstraintBuilder.setWidthOfElement(self, height: width))
    }

    func setWidthRelativeTo(element: UIView, constant: CGFloat, weight: CGFloat) {
        self.superview?.addConstraint(ConstraintBuilder.setWidthOfElementRelativeToView(constant: constant, weight: weight, view: self, anotherView: element))
    }

    func setHeight(height: CGFloat) {
        self.superview?.addConstraint(ConstraintBuilder.setHeightOfElement(self, height: height))
    }

    func setHeightMinimum(height: CGFloat) {
        self.superview?.addConstraint(ConstraintBuilder.setMinimalHeightOfElement(self, minimalHeight: height))
    }

    func setHeightMaximum(height: CGFloat) {
        self.superview?.addConstraint(ConstraintBuilder.setMaximallHeightOfElement(self, maximalHeight: height))
    }
}

extension ConstraintBuilder {
    class func placeInSuperview(parent: UIView, child: UIView, placement: PlacementMargins) {
        if let top = placement.topMargin {
            parent.addConstraint(ConstraintBuilder.pinElementToTopOfSuperView(top, view: child, parentView: parent))
        }
        if let bottom = placement.bottomMargin {
            parent.addConstraint(ConstraintBuilder.pinElementToBotomOfSuperView(bottom, view: child, parentView: parent))
        }
        if let right = placement.rightMargin {
            parent.addConstraint(ConstraintBuilder.pinElementToRightSideOfSuperView(right, view: child, parentView: parent))
        }
        if let left = placement.leftMargin {
            parent.addConstraint(ConstraintBuilder.pinElementToLeftSideOfSuperView(left, view: child, parentView: parent))
        }
    }
}

