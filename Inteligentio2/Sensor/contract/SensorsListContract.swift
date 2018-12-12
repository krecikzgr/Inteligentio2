//
//  SensorsListContract.swift
//  Inteligentio2
//
//  Created by Adrian on 12/12/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

protocol SensorsViewProtocol:NSObjectProtocol {
    func set(sensors:[SwitchCellData])
}

protocol SensorsPresenterProtocol {
    func loadSensors(page:Int, size:Int)
}

protocol SensorsRepositoryProtocol  {
}
