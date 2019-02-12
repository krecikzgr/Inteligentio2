//
//  SampleReusableCell.swift
//  GSDMobileFramework
//
//  Created by Mariusz Sut on 24/01/2019.
//  Copyright © 2019 GSD Software mbH. All rights reserved.
//

import Foundation
import UIKit

public class SampleReusableCell: CollectionCell<String> {
    let label: UILabel = UILabel()
    
    override public func initialize() {
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.textAlignment = .center
        self.label.textColor = .green
        self.addSubview(self.label)
        
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -10))
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: self.label, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10))
    }
}
