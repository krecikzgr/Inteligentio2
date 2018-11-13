//
//  DataSource.swift
//  Inteligentio2
//
//  Created by Adrian on 10/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

class MasterDataSource:DataSource {
    override init() {
        super.init()
        self.initData()
    }

    fileprivate func initData() {
        self.items = [
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "Scenes")),
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "Rooms")),
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "Events")),
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "Sensors")),
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "Schedule")),
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "SystemStatus")),
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "Settings"))
        ]
    }
}

