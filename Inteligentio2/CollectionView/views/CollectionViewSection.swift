//
//  CollectionViewSection.swift
//  GenericCollectionView
//
//  Created by Adrian Kaleta on 17/01/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//
import UIKit

@objc public protocol SectionCellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView, index: IndexPath, collectionViewWidth: CGFloat)
    func numberOfItems() -> Int
    func onItemClick(indexPath: IndexPath)
    func onItemLongClick(indexPath: IndexPath)
    func onLastElementDisplay(indexPath: IndexPath)
    func register(collectionView: UICollectionView)
    func getHeader()-> CollectionReusableViewProtocol?
    func getFooter()-> CollectionReusableViewProtocol?
}

public typealias OnItemClick<T> = (_ item: T, _ indexPath: IndexPath) -> Void
public typealias LastElementAction<T> = (_ item: T, _ indexPath: IndexPath) -> Void

public class CollectionViewSection<T: CollectionCell<Item>, Item>: SectionCellConfigurator {
    
    fileprivate let cellMarginConstant: CGFloat = 10
    
    public static var reuseId: String { return T.reusableIdentifier() }
    
    public var header: CollectionReusableViewProtocol?
    public var footer: CollectionReusableViewProtocol?
    
    public var items: [Item] = []
    public var onItemClickAction: OnItemClick<Item>? = nil
    public var onLongClickAction: OnItemClick<Item>? = nil
    public var onLastElementAction: LastElementAction<Item>? = nil
    public var margin: CGFloat = 1.0
    public var numberOfColumns: Int? = 1
    public var cellWidth: CGFloat? = nil
    public var cellHeight: CGFloat? = nil
    
    public init() {
        
    }
    
    public func configure(cell: UIView, index: IndexPath, collectionViewWidth: CGFloat) {
        guard let cell = cell as? CollectionCell<Item> else {
            return
        }
        self.configure(cell: cell, index: index, collectionViewWidth: collectionViewWidth)
    }
    
    fileprivate func configure(cell: CollectionCell<Item>, index: IndexPath, collectionViewWidth: CGFloat) {
        guard let item = self.items[safe: index.row] else {
            return
        }
        if self.numberOfColumns != nil {
            self.configureCellForFixedColumnNumber(cell: cell, index: index.row, collectionViewWidth: collectionViewWidth)
        } else if self.cellWidth != nil {
            self.configureCellForFixedWidth(cell: cell, index: index.row)
        }
        if let verticalCell = cell as? VerticalCell<VerticalCell<T, Item>, [Item]>{
            verticalCell.parent = self
        }
        cell.setupHeight(height: self.cellHeight)
        (cell as! T).updateFor(item: item)
    }
    
    fileprivate func configureCellForFixedColumnNumber(cell: CollectionCell<Item>, index: Int, collectionViewWidth: CGFloat) {
        let cellWidth = (collectionViewWidth) / CGFloat(self.numberOfColumns!) - 2 * self.margin - self.cellMarginConstant
        cell.setup(width: cellWidth)
    }
    
    fileprivate func configureCellForFixedWidth(cell: CollectionCell<Item>, index: Int) {
        cell.setup(width: cellWidth!)
    }
    
    public func onItemClick(indexPath: IndexPath) {
        self.onItemClickAction?(self.items[indexPath.row], indexPath)
    }
    
    public func onItemLongClick(indexPath: IndexPath) {
        self.onLongClickAction?(self.items[indexPath.row], indexPath)
    }
    
    public func onLastElementDisplay(indexPath: IndexPath) {
        self.onLastElementAction?(self.items[indexPath.row], indexPath)
    }
    
    public func numberOfItems() -> Int {
        return self.items.count
    }
    
    public func getHeader() -> CollectionReusableViewProtocol? {
        return self.header
    }
    
    public func getFooter() -> CollectionReusableViewProtocol? {
        return self.footer
    }
    
    public func register(collectionView: UICollectionView) {
        collectionView.registerCell(class: T.self)
        self.header?.register(collectionView: collectionView)
        self.footer?.register(collectionView: collectionView)
    }
}

extension CollectionViewSection {
    public class func build(block: ((CollectionViewSection) -> Void)) -> CollectionViewSection {
        let section = CollectionViewSection()
        block(section)
        return section
    }
}
