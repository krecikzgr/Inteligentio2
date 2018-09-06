//
//  FormCell.swift
//  KDA
//
//  Created by Adrian Kaleta on 05/09/2018.
//  Copyright © 2018 GSD. All rights reserved.
//

import Foundation
import UIKit

protocol Updatable: class {
    associatedtype ViewData
    func update(viewData: ViewData)
}

protocol CellConfiguratorType {

    var reuseIdentifier: String { get }
    var cellClass: AnyClass { get }
    func update(cell: UITableViewCell)
}

struct CellConfigurator<Cell> where Cell: Updatable, Cell: UITableViewCell {

    let viewData: Cell.ViewData
    let reuseIdentifier: String = NSStringFromClass(Cell.self)
    let cellClass: AnyClass = Cell.self

    func update(cell: UITableViewCell) {
        if let cell = cell as? Cell {
            cell.update(viewData: viewData)
        }
    }
}

extension CellConfigurator: CellConfiguratorType {

}
