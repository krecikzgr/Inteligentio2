//
//  SampleFooter.swift
//  GSDMobileFramework
//
//  Created by Mariusz Sut on 24/01/2019.
//  Copyright © 2019 GSD Software mbH. All rights reserved.
//

import Foundation

public class SampleFooter: CollectionReusableView<SampleReusableCell, String> {
    
    var title: String?
    
    public convenience init(title: String) {
        self.init(reusableType: .footer)
        self.title = title
    }
    
    public override init(reusableType: ReusableType) {
        super.init(reusableType: reusableType)
    }
    
    override public func configure(cell: SampleReusableCell) {
        cell.label.text = title
    }
}
