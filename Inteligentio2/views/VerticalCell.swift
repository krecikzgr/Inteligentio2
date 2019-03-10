//
//  VerticalCell.swift
//  Inteligentio2
//
//  Created by Adrian on 09/03/2019.
//  Copyright © 2019 AdrianKaleta. All rights reserved.
//

import UIKit


public class VerticalCell<Cell:CollectionCell<CellData>, CellData>: CollectionCell<[CellData]> {

    var collectionView: UICollectionView?
    var dataSource: CollectionViewDataSource?
    var mainSection: CollectionViewSection<Cell, CellData>?
    weak var parent: CollectionViewSection<VerticalCell<Cell, CellData>, [CellData]>?

    open override func initialize() {
        self.initCollectionView()
        self.initMainSection()
        self.initDataSource()
    }

    public override func updateFor(item: [CellData]) {
        self.mainSection?.items = item
        self.collectionView?.reloadData()
    }

    fileprivate func initCollectionView() {
        self.backgroundColor = UIColor.clear
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView?.backgroundColor = .mainDark()
        self.addSubview(self.collectionView!)

        self.collectionView?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.right.equalTo(self.snp.right).offset(-10)
            make.top.equalTo(self.snp.top).offset(10)
            make.left.equalTo(self.snp.left).offset(10)
        })
    }

    fileprivate func initMainSection() {
        self.mainSection = CollectionViewSection<Cell, CellData>.build(block: { (section) in
            section.numberOfColumns = nil
            section.onItemClickAction = { item, indexPath in
                self.parent?.onItemClickAction?(item, indexPath)
            }
        })
    }

    fileprivate func initDataSource() {
        self.dataSource = CollectionViewDataSource(collectionView: self.collectionView!)
        self.dataSource?.addSection(section: self.mainSection!)
    }
}
