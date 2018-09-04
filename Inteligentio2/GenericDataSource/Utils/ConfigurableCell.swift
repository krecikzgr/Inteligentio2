//
//  ConfigurableCell.swift
//  Inteligentio2
//
//  Created by Adrian on 03.09.2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import UIKit

public protocol ConfigurableCell {
    associatedtype T

    func configure(_ item: T, at indexPath:IndexPath)

}


protocol Updatable: class {
    associatedtype ViewData

    func updateWithViewData(viewData: ViewData)
}

struct CustomCellData {
    var data = "STRING"
}

class CustomCell: UITableViewCell {

}

extension CustomCell:Updatable {
    typealias ViewData = CustomCellData
    func updateWithViewData(viewData: CustomCellData) {

    }
}

struct CellConfigurator<Cell> where Cell: Updatable, Cell: UITableViewCell {

    let viewData: Cell.ViewData
    let reuseIdentifier: String = NSStringFromClass(Cell.self)
    let cellClass: AnyClass = Cell.self

    func updateCell(cell: UITableViewCell) {
        if let cell = cell as? Cell {
            cell.updateWithViewData(viewData: viewData)
        }
    }
}
//http://holko.pl/2016/01/05/typed-table-view-controller/
