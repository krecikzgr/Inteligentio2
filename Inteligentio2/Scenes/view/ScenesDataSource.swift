//
//  ScenesDataSource.swift
//  Inteligentio2
//
//  Created by Adrian on 13/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

class ScenesDtaSource:DataSource {
    override init() {
        super.init()
        self.initData()
    }

    func setViewData(viewData:[SwitchCellData]) {
        self.items.removeAll()
        for singleRow in viewData {
            self.items.append( CellConfigurator<SwitchCell>(viewData: singleRow) )
        }
    }
}
