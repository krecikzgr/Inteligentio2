//
//  SensorsRepository.swift
//  Inteligentio2
//
//  Created by Adrian on 12/12/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

class SensorsRepository:Repository, SensorsRepositoryProtocol {
    typealias T = Sensor

    var baseClass: String = "sensor"

    var getObjectsResponse: ((ListResult<Sensor>) -> Void)?

    fileprivate var setSceneActiveResponse: ResultResponse?

    func setSceneAsActive(result:@escaping ResultResponse) {
        //        self.setSceneActiveResponse = result
        //        let resultObject = ApiResult()
        //        resultObject.message = "Everything is ok"
        //        resultObject.success = true
        //        resultObject.statusCode = 200
        //        self.setSceneActiveResponse?(.success(resultObject))
    }
}
