//
//  SensorsPresenter.swift
//  Inteligentio2
//
//  Created by Adrian on 12/12/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

class SensorsPresenter: SensorsPresenterProtocol {
    var repository: SensorsRepository?
    weak var view: SensorsViewProtocol?

    init(view:SensorsViewProtocol, repository: SensorsRepository? = nil) {
        self.view = view
        self.repository = repository ?? SensorsRepository()
    }

    func loadSensors(page:Int, size:Int) {
        self.repository?.getAll(baseAddress: Server.address.rawValue, page: 0, size: 100) {
            [unowned self] (result) in
            switch result {
            case let .success(result):
                self.handleSuccess(result: result)
            case let .failure(error):
                print("load scenes error \(error)")
            default:
                print("Some error")
            }
        }
    }

    func handleSuccess(result:ResponseList<Sensor>) {
        var viewData:[SwitchCellData] = []
        for sensor in result.data ?? [] {
            var singleRow = SwitchCellData(identifier: sensor.id,
                                           title: sensor.description ?? "",
                                           switchDataState: sensor.isActive ?? false,
                                           switchSatusChanged: nil)
            viewData.append(singleRow)
        }
        self.view?.set(sensors: viewData)
    }
}
