//
//  SensorsDataSource.swift
//  Inteligentio2
//
//  Created by Adrian on 12/12/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

class SensorsDtaSource:DataSource {
    override init() {
        super.init()
    }

    func setViewData(viewData:[SwitchCellData]) {
        self.items.removeAll()
        for singleRow in viewData {
            self.items.append( CellConfigurator<SwitchCell>(viewData: singleRow) )
        }
    }
}
