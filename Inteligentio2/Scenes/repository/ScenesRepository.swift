//
//  ScenesRepository.swift
//  Inteligentio2
//
//  Created by Adrian on 12/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation


class ScenesRepository:Repository {
    typealias T = Scene

    var baseClass: String = "scenes"

    var getObjectsResponse: ((ListResult<Scene>) -> Void)?

    fileprivate var setSceneActiveResponse: ResultResponse?

    func setSceneAsActive(result:@escaping ResultResponse) {
        self.setSceneActiveResponse = result
        let resultObject = ApiResult()
        resultObject.message = "Everything is ok"
        resultObject.success = true
        resultObject.statusCode = 200
        self.setSceneActiveResponse?(.success(resultObject))
    }
}
