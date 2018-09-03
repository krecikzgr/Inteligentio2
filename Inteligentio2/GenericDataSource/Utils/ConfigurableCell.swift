//
//  ConfigurableCell.swift
//  Inteligentio2
//
//  Created by Adrian on 03.09.2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import UIKit

public protocol ConfigurableView {
    associatedtype T

    func configure(_ item: T, at indexPath:IndexPath)

}
