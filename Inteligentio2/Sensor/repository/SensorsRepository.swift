//
//  SensorsRepository.swift
//  Inteligentio2
//
//  Created by Adrian on 12/12/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

class SensorsRepository:Repository, SensorsRepositoryProtocol {
    var patchObjectResponse: ((Result<Sensor>) -> Void)?

    typealias T = Sensor

    var baseClass: String = "sensor"

    var getObjectsResponse: ((ListResult<Sensor>) -> Void)?

    fileprivate var setSceneActiveResponse: ResultResponse?

}
