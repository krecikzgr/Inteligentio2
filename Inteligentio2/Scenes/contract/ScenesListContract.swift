//
//  ScenesListContract.swift
//  Inteligentio2
//
//  Created by Adrian on 13/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

protocol ScenesViewProtocol:NSObjectProtocol {
    func set(scenes:[SwitchCellData])
}

protocol ScenesPresenterProtocol {
    func loadScenes(page:Int, size:Int)
}

protocol ScenesRepositoryProtocol {
}
