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

        let scene = Scene()
        scene.id = 43
        scene.name = "SOMERANDOME SCENE"

        self.repository?.patchObject(baseAddress: Server.address.rawValue, object: scene) { [unowned self] (result) in
            switch result {
            case let .success(result):
                print("case success \(result.message)")
            case let .failure(error):
                print("some error \(error)")
            default:
                print("some other error")
            }
        }
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

    func handleSuccess(result:BaseListResponse<Scene>) {
        var viewData:[SwitchCellData] = []
        for scene in result.data ?? [] {
            var singleRow = SwitchCellData(identifier: "id", title: scene.description ?? "", switchDataState: false, switchSatusChanged: nil)
            viewData.append(singleRow)
        }
        self.view?.set(scenes: viewData)
    }
}
