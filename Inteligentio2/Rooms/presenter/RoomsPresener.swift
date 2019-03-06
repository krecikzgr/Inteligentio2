//
//  RoomsPresener.swift
//  Inteligentio2
//
//  Created by Adrian on 06/03/2019.
//  Copyright © 2019 AdrianKaleta. All rights reserved.
//

import Foundation

class RoomsPresenter: RoomsPresenterProtocol {
    var repository: RoomsRepository?
    weak var view: RoomsViewProtocol?

    init(view:RoomsViewProtocol, repository: RoomsRepository? = nil) {
        self.view = view
        self.repository = repository ?? RoomsRepository()
    }

    func loadRooms(page:Int, size:Int) {
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

    func handleSuccess(result:ResponseList<Room>) {
        var viewData:[SwitchCellData] = []
        for room in result.data ?? [] {
            var singleRow = SwitchCellData(identifier: room.id,
                                           title: room.description ?? "",
                                           switchDataState: room.isActive ?? false,
                                           switchSatusChanged: nil)
            viewData.append(singleRow)
        }
        self.view?.set(rooms: viewData)
    }
}
