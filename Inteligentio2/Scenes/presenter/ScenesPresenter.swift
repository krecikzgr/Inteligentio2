//
//  ScenesPresenter.swift
//  Inteligentio2
//
//  Created by Adrian on 13/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

enum Server:String {
    case address = "192.168.0.111"
}

class ScenesPresenter:ScenesPresenterProtocol {
    var repository:ScenesRepository?
    weak var view: ScenesViewProtocol?

    init(view:ScenesViewProtocol) {
        self.view = view
        self .repository = ScenesRepository()
    }

    func loadScenes(page:Int, size:Int) {
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

    func handleSuccess(result:ResponseList<Scene>) {
        var viewData:[SwitchCellData] = []
        print("HANDLE SCENES DATA RESPONSE \(result.data)")
        for scene in result.data ?? [] {
            var singleRow = SwitchCellData(identifier: "id", title: scene.name ?? "", switchDataState: false, switchSatusChanged: nil)
            viewData.append(singleRow)
        }
        self.view?.set(scenes: viewData)
    }
}
