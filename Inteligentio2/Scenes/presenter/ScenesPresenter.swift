//
//  ScenesPresenter.swift
//  Inteligentio2
//
//  Created by Adrian on 13/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

enum Server:String {
    case address = "http://192.168.0.111:3001/"
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
            case let .success(scenes):
                self.handleSuccess(scenes: scenes)
            default:
                print("Some error")
            }
        }
    }

    func handleSuccess(scenes:[Scene]) {
        var viewData:[SwitchCellData] = []

        for scene in scenes {
            var singleRow = SwitchCellData(identifier: "id", title: scene.description ?? "", switchDataState: false, switchSatusChanged: nil)
            viewData.append(singleRow)
        }
        self.view?.set(scenes: viewData)
    }
}
