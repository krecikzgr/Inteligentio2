//
//  ConstraintBuilder.swift
//  DocuFrame
//
//  Created by Adrian Kaleta on 03.04.2015.
//  Copyright (c) 2015 Adrian Kaleta. All rights reserved.
//

import UIKit

class ConstraintBuilder: NSObject {

    class func pinElementToSuperViewBounds(spacing:CGFloat, view:UIView, parentView: UIView ) -> [NSLayoutConstraint] {
        var constraints:[NSLayoutConstraint] = []
        constraints.append( ConstraintBuilder.pinElementToBotomOfSuperView(spacing, view: view, parentView: parentView) )
        constraints.append(ConstraintBuilder.pinElementToLeftSideOfSuperView(spacing, view: view, parentView: parentView) )
        constraints.append(ConstraintBuilder.pinElementToTopOfSuperView(spacing, view: view, parentView: parentView) )
        constraints.append(ConstraintBuilder.pinElementToRightSideOfSuperView(spacing, view: view, parentView: parentView))
        return constraints

    }

    class func pinElementToUpperView(_ spacing:CGFloat, view:UIView, upperView:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.top,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    upperView,
                                    attribute: NSLayoutConstraint.Attribute.bottom,
                                    multiplier: 1.0,
                                    constant:spacing)
    }
    class func pinElementToBottomView(_ spacing:CGFloat, view:UIView, bottomView:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.bottom,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    bottomView,
                                    attribute: NSLayoutConstraint.Attribute.top,
                                    multiplier: 1.0,
                                    constant:spacing)
    }
    class func pinElementToLeftSideOfView(_ spacing:CGFloat, view:UIView, anotherView:UIView) -> NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.left,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    anotherView,
                                    attribute: NSLayoutConstraint.Attribute.right,
                                    multiplier: 1.0,
                                    constant:spacing)
    }
    class func pinElementToLeftSideOfView2(_ spacing:CGFloat, view:UIView, anotherView:UIView, prioritty:Float?) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view,
                                            attribute: NSLayoutConstraint.Attribute.right,
                                            relatedBy: NSLayoutConstraint.Relation.equal,
                                            toItem:    anotherView,
                                            attribute: NSLayoutConstraint.Attribute.left,
                                            multiplier: 1.0,
                                            constant:spacing)

        guard prioritty != nil else {
            return constraint

        }
        constraint.priority = UILayoutPriority(rawValue: prioritty!)
        return constraint;

    }
    class func pinElementToLeftSideOfViewMaximum(_ spacing:CGFloat, view:UIView, anotherView:UIView) -> NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.left,
                                    relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
                                    toItem:    anotherView,
                                    attribute: NSLayoutConstraint.Attribute.right,
                                    multiplier: 1.0,
                                    constant:spacing)
    }

    class func pinElementToRightSideOfView(_ spacing:CGFloat, view:UIView, anotherView:UIView) -> NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.left,
                                    relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
                                    toItem:    anotherView,
                                    attribute: NSLayoutConstraint.Attribute.right,
                                    multiplier: 1.0,
                                    constant:spacing)
    }
    class func pinElementExactlyToRightSideOfView(_ spacing:CGFloat, view:UIView, anotherView:UIView) -> NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.left,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    anotherView,
                                    attribute: NSLayoutConstraint.Attribute.right,
                                    multiplier: 1.0,
                                    constant:spacing)
    }
    //Mark: - Pin elements to superview
    class func pinElementToTopOfSuperView(_ spacing:CGFloat, view:UIView, parentView:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.top,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    parentView,
                                    attribute: NSLayoutConstraint.Attribute.top,
                                    multiplier: 1.0,
                                    constant:spacing)

    }

    class func pinElementToBotomOfSuperView(_ spacing:CGFloat, view:UIView, parentView:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.bottom,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    parentView,
                                    attribute: NSLayoutConstraint.Attribute.bottom,
                                    multiplier: 1.0,
                                    constant:spacing)
    }

    class func pinElementToRightSideOfSuperView(_ spacing:CGFloat, view:UIView, parentView:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.right,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    parentView,
                                    attribute: NSLayoutConstraint.Attribute.right,
                                    multiplier: 1.0,
                                    constant:spacing)

    }
    class func pinElementToLeftSideOfSuperView(_ spacing:CGFloat, view:UIView, parentView:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.left,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    parentView,
                                    attribute: NSLayoutConstraint.Attribute.left,
                                    multiplier: 1.0,
                                    constant:spacing)

    }
    class func pinElementInTheMiddleXPosition(_ spacing:CGFloat, view:UIView, parentView:UIView) -> NSLayoutConstraint{
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.centerX,
                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                  toItem: parentView,
                                  attribute: NSLayoutConstraint.Attribute.centerX,
                                  multiplier: 1.0,
                                  constant: spacing)
    }
    class func pinElementInTheMiddleYPosition(_ spacing:CGFloat,view:UIView,parentView:UIView) -> NSLayoutConstraint{
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutConstraint.Attribute.centerY,
                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                  toItem: parentView,
                                  attribute: NSLayoutConstraint.Attribute.centerY,
                                  multiplier: 1.0,
                                  constant: spacing)
    }

    class func setMinimalHeightOfElement(_ view:UIView,minimalHeight:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.height,
                                    relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
                                    toItem:    nil,
                                    attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                    multiplier: 1.0,
                                    constant:minimalHeight)
    }
    class func setHeightOfElement(_ view:UIView,height:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.height,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    nil,
                                    attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                    multiplier: 1.0,
                                    constant:height)
    }
    class func setWidthOfElement(_ view:UIView,height:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.width,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    nil,
                                    attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                    multiplier: 1.0,
                                    constant:height)
    }
    class func setWidthOfElementRelativeToView(constant: CGFloat, weight:CGFloat, view:UIView, anotherView: UIView )->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.width,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    anotherView,
                                    attribute: NSLayoutConstraint.Attribute.width,
                                    multiplier: weight,
                                    constant:constant)
    }
    class func setMinimalWidthOfElement(_ view:UIView,minimalWidth:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.width,
                                    relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
                                    toItem:    nil,
                                    attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                    multiplier: 1.0,
                                    constant:minimalWidth)
    }
    class func setMaximallHeightOfElement(_ view:UIView,maximalHeight:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.height,
                                    relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual,
                                    toItem:    nil,
                                    attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                    multiplier: 1.0,
                                    constant:maximalHeight)
    }

    class func setMaximalWidthOfElement(_ view:UIView,maximalWidth:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.width,
                                    relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual,
                                    toItem:    nil,
                                    attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                    multiplier: 1.0,
                                    constant:maximalWidth)
    }
    class func setMaximalWidthOfElementToElement(_ view:UIView,view2:UIView,constant:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.width,
                                    relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual,
                                    toItem:    view2,
                                    attribute: NSLayoutConstraint.Attribute.width,
                                    multiplier: 1.0,
                                    constant:constant)
    }
    class func setMinimalWidthOfElementToElement(_ view:UIView,view2:UIView,constant:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.width,
                                    relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
                                    toItem:    view2,
                                    attribute: NSLayoutConstraint.Attribute.width,
                                    multiplier: 1.0,
                                    constant:constant)
    }
    class func setHeightOfElementToHeightOfAnotherElement(_ view:UIView,view2:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.height,
                                    relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
                                    toItem:    view2,
                                    attribute: NSLayoutConstraint.Attribute.height,
                                    multiplier: 1.0,
                                    constant:0)
    }
    //Trailing - Right
    //Leading - Left

    //Taken form previous implementation
    class func setRLeadingSpaceToSuperView(_ space:CGFloat,view:UIView,view2:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.leading,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    view2,
                                    attribute: NSLayoutConstraint.Attribute.leading,
                                    multiplier: 1.0,
                                    constant:space)
    }
    class func setRHorizontalSpaceConstraintWithLeftView(_ space:CGFloat,leftView:UIView, rightView:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: leftView,
                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    rightView,
                                    attribute: NSLayoutConstraint.Attribute.leading,
                                    multiplier: 1.0,
                                    constant:-space)
    }

    class func setRTrailigSpaceToSuperView(_ space:CGFloat,view:UIView,view2:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    view2,
                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                    multiplier: 1.0,
                                    constant:-space)
    }
    class func setRTopSpaceToSuperview(_ space:CGFloat,view:UIView,view2:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.top,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    view2,
                                    attribute: NSLayoutConstraint.Attribute.top,
                                    multiplier: 1.0,
                                    constant:space)
    }
    class func setRBottomSpaceToSuperview(_ space:CGFloat,view:UIView,view2:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutConstraint.Attribute.bottom,
                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                    toItem:    view2,
                                    attribute: NSLayoutConstraint.Attribute.bottom,
                                    multiplier: 1.0,
                                    constant:space)
    }
    class func setRmatchAllSpacesToSuperview(_ space:CGFloat,view:UIView,superView:UIView) {
        let bottomConstraint = self.setRBottomSpaceToSuperview(0, view: view, view2: superView)
        bottomConstraint.priority = UILayoutPriority(rawValue: 999);
        superView.addConstraint(bottomConstraint)
        superView.addConstraint(self.setRTopSpaceToSuperview(2, view: view, view2: superView))
        let trailingConstraint = self.setRTrailigSpaceToSuperView(20, view: view, view2: superView)
        trailingConstraint.priority = UILayoutPriority(rawValue: 999);
        superView.addConstraint(trailingConstraint)
        superView.addConstraint(self.setRLeadingSpaceToSuperView(10, view: view, view2: superView))
    }

}

extension UIView
{
    func removePrototypingConstraints()
    {
        for constraint in self.constraints
        {
            let name = NSStringFromClass(type(of: constraint))

            if (name.hasPrefix("NSIBPrototyping"))
            {
                self.removeConstraint(constraint)
            }
        }
    }
}
