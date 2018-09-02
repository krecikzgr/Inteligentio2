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
                                    attribute: NSLayoutAttribute.top,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    upperView,
                                    attribute: NSLayoutAttribute.bottom,
                                    multiplier: 1.0,
                                    constant:spacing)
    }
    class func pinElementToBottomView(_ spacing:CGFloat, view:UIView, bottomView:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.bottom,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    bottomView,
                                    attribute: NSLayoutAttribute.top,
                                    multiplier: 1.0,
                                    constant:spacing)
    }
    class func pinElementToLeftSideOfView(_ spacing:CGFloat, view:UIView, anotherView:UIView) -> NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.left,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    anotherView,
                                    attribute: NSLayoutAttribute.right,
                                    multiplier: 1.0,
                                    constant:spacing)
    }
    class func pinElementToLeftSideOfView2(_ spacing:CGFloat, view:UIView, anotherView:UIView, prioritty:Float?) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view,
                                            attribute: NSLayoutAttribute.right,
                                            relatedBy: NSLayoutRelation.equal,
                                            toItem:    anotherView,
                                            attribute: NSLayoutAttribute.left,
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
                                    attribute: NSLayoutAttribute.left,
                                    relatedBy: NSLayoutRelation.greaterThanOrEqual,
                                    toItem:    anotherView,
                                    attribute: NSLayoutAttribute.right,
                                    multiplier: 1.0,
                                    constant:spacing)
    }

    class func pinElementToRightSideOfView(_ spacing:CGFloat, view:UIView, anotherView:UIView) -> NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.left,
                                    relatedBy: NSLayoutRelation.greaterThanOrEqual,
                                    toItem:    anotherView,
                                    attribute: NSLayoutAttribute.right,
                                    multiplier: 1.0,
                                    constant:spacing)
    }
    class func pinElementExactlyToRightSideOfView(_ spacing:CGFloat, view:UIView, anotherView:UIView) -> NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.left,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    anotherView,
                                    attribute: NSLayoutAttribute.right,
                                    multiplier: 1.0,
                                    constant:spacing)
    }
    //Mark: - Pin elements to superview
    class func pinElementToTopOfSuperView(_ spacing:CGFloat, view:UIView, parentView:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.top,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    parentView,
                                    attribute: NSLayoutAttribute.top,
                                    multiplier: 1.0,
                                    constant:spacing)

    }

    class func pinElementToBotomOfSuperView(_ spacing:CGFloat, view:UIView, parentView:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.bottom,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    parentView,
                                    attribute: NSLayoutAttribute.bottom,
                                    multiplier: 1.0,
                                    constant:spacing)
    }

    class func pinElementToRightSideOfSuperView(_ spacing:CGFloat, view:UIView, parentView:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.right,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    parentView,
                                    attribute: NSLayoutAttribute.right,
                                    multiplier: 1.0,
                                    constant:spacing)

    }
    class func pinElementToLeftSideOfSuperView(_ spacing:CGFloat, view:UIView, parentView:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.left,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    parentView,
                                    attribute: NSLayoutAttribute.left,
                                    multiplier: 1.0,
                                    constant:spacing)

    }
    class func pinElementInTheMiddleXPosition(_ spacing:CGFloat, view:UIView, parentView:UIView) -> NSLayoutConstraint{
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.centerX,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: parentView,
                                  attribute: NSLayoutAttribute.centerX,
                                  multiplier: 1.0,
                                  constant: spacing)
    }
    class func pinElementInTheMiddleYPosition(_ spacing:CGFloat,view:UIView,parentView:UIView) -> NSLayoutConstraint{
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.centerY,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: parentView,
                                  attribute: NSLayoutAttribute.centerY,
                                  multiplier: 1.0,
                                  constant: spacing)
    }

    class func setMinimalHeightOfElement(_ view:UIView,minimalHeight:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.height,
                                    relatedBy: NSLayoutRelation.greaterThanOrEqual,
                                    toItem:    nil,
                                    attribute: NSLayoutAttribute.notAnAttribute,
                                    multiplier: 1.0,
                                    constant:minimalHeight)
    }
    class func setHeightOfElement(_ view:UIView,height:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.height,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    nil,
                                    attribute: NSLayoutAttribute.notAnAttribute,
                                    multiplier: 1.0,
                                    constant:height)
    }
    class func setWidthOfElement(_ view:UIView,height:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.width,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    nil,
                                    attribute: NSLayoutAttribute.notAnAttribute,
                                    multiplier: 1.0,
                                    constant:height)
    }
    class func setWidthOfElementRelativeToView(constant: CGFloat, weight:CGFloat, view:UIView, anotherView: UIView )->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.width,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    anotherView,
                                    attribute: NSLayoutAttribute.width,
                                    multiplier: weight,
                                    constant:constant)
    }
    class func setMinimalWidthOfElement(_ view:UIView,minimalWidth:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.width,
                                    relatedBy: NSLayoutRelation.greaterThanOrEqual,
                                    toItem:    nil,
                                    attribute: NSLayoutAttribute.notAnAttribute,
                                    multiplier: 1.0,
                                    constant:minimalWidth)
    }
    class func setMaximallHeightOfElement(_ view:UIView,maximalHeight:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.height,
                                    relatedBy: NSLayoutRelation.lessThanOrEqual,
                                    toItem:    nil,
                                    attribute: NSLayoutAttribute.notAnAttribute,
                                    multiplier: 1.0,
                                    constant:maximalHeight)
    }

    class func setMaximalWidthOfElement(_ view:UIView,maximalWidth:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.width,
                                    relatedBy: NSLayoutRelation.lessThanOrEqual,
                                    toItem:    nil,
                                    attribute: NSLayoutAttribute.notAnAttribute,
                                    multiplier: 1.0,
                                    constant:maximalWidth)
    }
    class func setMaximalWidthOfElementToElement(_ view:UIView,view2:UIView,constant:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.width,
                                    relatedBy: NSLayoutRelation.lessThanOrEqual,
                                    toItem:    view2,
                                    attribute: NSLayoutAttribute.width,
                                    multiplier: 1.0,
                                    constant:constant)
    }
    class func setMinimalWidthOfElementToElement(_ view:UIView,view2:UIView,constant:CGFloat) ->NSLayoutConstraint{
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.width,
                                    relatedBy: NSLayoutRelation.greaterThanOrEqual,
                                    toItem:    view2,
                                    attribute: NSLayoutAttribute.width,
                                    multiplier: 1.0,
                                    constant:constant)
    }
    class func setHeightOfElementToHeightOfAnotherElement(_ view:UIView,view2:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.height,
                                    relatedBy: NSLayoutRelation.greaterThanOrEqual,
                                    toItem:    view2,
                                    attribute: NSLayoutAttribute.height,
                                    multiplier: 1.0,
                                    constant:0)
    }
    //Trailing - Right
    //Leading - Left

    //Taken form previous implementation
    class func setRLeadingSpaceToSuperView(_ space:CGFloat,view:UIView,view2:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.leading,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    view2,
                                    attribute: NSLayoutAttribute.leading,
                                    multiplier: 1.0,
                                    constant:space)
    }
    class func setRHorizontalSpaceConstraintWithLeftView(_ space:CGFloat,leftView:UIView, rightView:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: leftView,
                                    attribute: NSLayoutAttribute.trailing,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    rightView,
                                    attribute: NSLayoutAttribute.leading,
                                    multiplier: 1.0,
                                    constant:-space)
    }

    class func setRTrailigSpaceToSuperView(_ space:CGFloat,view:UIView,view2:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.trailing,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    view2,
                                    attribute: NSLayoutAttribute.trailing,
                                    multiplier: 1.0,
                                    constant:-space)
    }
    class func setRTopSpaceToSuperview(_ space:CGFloat,view:UIView,view2:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.top,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    view2,
                                    attribute: NSLayoutAttribute.top,
                                    multiplier: 1.0,
                                    constant:space)
    }
    class func setRBottomSpaceToSuperview(_ space:CGFloat,view:UIView,view2:UIView) ->NSLayoutConstraint {
        return   NSLayoutConstraint(item: view,
                                    attribute: NSLayoutAttribute.bottom,
                                    relatedBy: NSLayoutRelation.equal,
                                    toItem:    view2,
                                    attribute: NSLayoutAttribute.bottom,
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
