//
//  PlacementMargins.swift
//  Inteligentio2
//
//  Created by Adrian on 02.09.2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import UIKit

struct PlacementMargins {

    var leftMargin: CGFloat?
    var rightMargin: CGFloat?
    var topMargin: CGFloat?
    var bottomMargin: CGFloat?

    init(leftMargin: CGFloat? = 0.0, rightMargin: CGFloat? = 0.0, topMargin: CGFloat? = 0.0, bottomMargin: CGFloat? = 0.0) {
        self.leftMargin = leftMargin
        self.rightMargin = rightMargin
        self.topMargin = topMargin
        self.bottomMargin = bottomMargin
    }

    init(margin: CGFloat = 0.0) {
        self.leftMargin = margin
        self.rightMargin = -margin
        self.topMargin = margin
        self.bottomMargin = -margin
    }

}
