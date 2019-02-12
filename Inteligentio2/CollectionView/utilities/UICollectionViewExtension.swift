//
//  UICollectionViewExtension.swift
//  GSDMobileFramework
//
//  Created by Adrian Kaleta on 18/01/2019.
//  Copyright © 2019 GSD Software mbH. All rights reserved.
//
import UIKit

extension UICollectionView {
    public func registerCell<T:UICollectionViewCell>(`class`: T.Type) {
        register(`class`, forCellWithReuseIdentifier: `class`.reusableIdentifier())
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(withClass `class`: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reusableIdentifier(), for: indexPath) as? T else {
            fatalError("Error: cell with identifier: \(`class`.reusableIdentifier()) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
}
