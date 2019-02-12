//
//  CollectionViewDataSource.swift
//  GenericCollectionView
//
//  Created by Mariusz Sut on 09/12/2018.
//  Copyright © 2018 Mariusz Sut. All rights reserved.
//

import UIKit

public class CollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    fileprivate var sections: [SectionCellConfigurator] = []
    fileprivate weak var collectionView: UICollectionView?
    
    public init(collectionView: UICollectionView) {
        super.init()
        self.collectionView = collectionView
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    public func setSections(_ sections: [SectionCellConfigurator]) {
        self.sections = sections
        guard self.collectionView != nil else {
            return
        }
        self.sections.forEach { $0.register(collectionView: self.collectionView!) }
    }
    
    func addSection(section: SectionCellConfigurator) {
        self.sections.append(section)
        guard self.collectionView != nil else {
            return
        }
        section.register(collectionView: self.collectionView!)
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sections[section].numberOfItems()
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let configurator = self.sections[indexPath.section]
        let headerConfigurator = configurator.getHeader()
        let footerConfigurator = configurator.getFooter()
        
        switch kind {
        case UICollectionView.elementKindSectionHeader where headerConfigurator != nil:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type(of: headerConfigurator!).reuseId, for: indexPath)
            headerConfigurator?.configureCell(cell: header)
            return header
        case UICollectionView.elementKindSectionFooter where footerConfigurator != nil:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type(of: footerConfigurator!).reuseId, for: indexPath)
            footerConfigurator?.configureCell(cell: footer)
            return footer
        default:
            return UICollectionReusableView()
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let configurator = self.sections[indexPath.section]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: type(of: configurator).reuseId, for: indexPath)
        configurator.configure(cell: cell, index: indexPath, collectionViewWidth: collectionView.collectionViewLayout.collectionViewContentSize.width)
        self.configureLongClick(indexPath: indexPath, cell: cell, configurator: configurator)
        self.checkIfLastElement(indexPath: indexPath, cell: cell, configurator: configurator)
        return cell
    }
    
    fileprivate func configureLongClick(indexPath: IndexPath, cell: UICollectionViewCell, configurator: SectionCellConfigurator) {
        cell.gestureRecognizers?
            .compactMap { $0 as? UILongPressGestureRecognizer }
            .forEach { cell.removeGestureRecognizer($0) }
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(CollectionViewDataSource.didDetectLongClick(sender:)))
        gestureRecognizer.minimumPressDuration = 1.0
        gestureRecognizer.indexPath = indexPath
        gestureRecognizer.targetConfigurator = configurator
        cell.addGestureRecognizer(gestureRecognizer)
    }
    
    fileprivate func checkIfLastElement(indexPath: IndexPath, cell: UICollectionViewCell, configurator: SectionCellConfigurator) {
        let section = self.sections[indexPath.section]
        if section.numberOfItems() == indexPath.row - 1 {
            section.onLastElementDisplay(indexPath: indexPath)
        }
    }
    
    @objc func didDetectLongClick(sender: UILongPressGestureRecognizer) {
        guard let indexPath = sender.indexPath, let section = sender.targetConfigurator else {
            return
        }
        section.onItemLongClick(indexPath: indexPath)
    }
    
    @objc func didDetectLongClick(section: SectionCellConfigurator, indexPath: IndexPath) {
        section.onItemLongClick(indexPath: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.sections[indexPath.section].onItemClick(indexPath: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard let headerConfigurator = self.sections[section].getHeader() else {
            return .zero
        }
        return CGSize(width: collectionView.frame.width, height: headerConfigurator.getHeight())
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard let footerConfigurator = self.sections[section].getFooter() else {
            return .zero
        }
        return CGSize(width: collectionView.frame.width, height: footerConfigurator.getHeight())
    }
}
