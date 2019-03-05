//
//  ScenesRepository.swift
//  Inteligentio2
//
//  Created by Adrian on 12/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation


class ScenesRepository:Repository {
    var patchObjectResponse: ((Result<Scene>) -> Void)?

    typealias T = Scene

    var baseClass: String = "scene"

    var getObjectsResponse: ((ListResult<Scene>) -> Void)?

    fileprivate var setSceneActiveResponse: ResultResponse?

}
