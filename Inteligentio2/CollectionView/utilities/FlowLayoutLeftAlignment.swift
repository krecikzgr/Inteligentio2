//
//  FlowLayoutLeftAlignment.swift
//  GastroKasse
//
//  Created by Mariusz Sut on 30/01/2019.
//  Copyright © 2019 Aleksy Tylkowski. All rights reserved.
//

import UIKit

class FlowLayoutLeftAlignment: UICollectionViewFlowLayout {
    fileprivate var spacing: CGFloat?

    convenience init(spacing: CGFloat? = nil) {
        self.init()
        self.spacing = spacing
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            layoutAttribute.frame.origin.x = leftMargin
            leftMargin += layoutAttribute.frame.width + (self.spacing ?? minimumInteritemSpacing)
            maxY = max(layoutAttribute.frame.maxY, maxY)
        }
        return attributes
    }
}
