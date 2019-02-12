//
//  CollectionReusableView.swift
//  GSDMobileFramework
//
//  Created by Mariusz Sut on 22/01/2019.
//  Copyright © 2019 GSD Software mbH. All rights reserved.
//

import UIKit

public enum ReusableType: String {
    case header
    case footer
}

@objc public protocol CollectionReusableViewProtocol {
    static var reuseId: String { get }
    func register(collectionView: UICollectionView)
    func configureCell(cell: UICollectionReusableView)
    func getHeight()-> CGFloat
}

open class CollectionReusableView<Cell: CollectionCell<Item>, Item>: CollectionReusableViewProtocol {
    public static var reuseId: String { return Cell.reusableIdentifier() }
    
    fileprivate let reusableType: ReusableType
    
    public init(reusableType: ReusableType) {
        self.reusableType = reusableType
    }
    
    public func configureCell(cell: UICollectionReusableView) {
        guard let cell = cell as? Cell else {
            return
        }
        self.configure(cell: cell)
    }
    
    public func register(collectionView: UICollectionView) {
        switch reusableType {
        case .header:
            collectionView.register(Cell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Cell.reusableIdentifier())
        case .footer:
            collectionView.register(Cell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Cell.reusableIdentifier())
        }
    }
    
    open func configure(cell: Cell) {
        
    }
    
    open func getHeight() -> CGFloat {
        return 60
    }
}

