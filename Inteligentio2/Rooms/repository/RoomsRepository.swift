//
//  RoomsRepository.swift
//  Inteligentio2
//
//  Created by Adrian on 06/03/2019.
//  Copyright © 2019 AdrianKaleta. All rights reserved.
//

import Foundation
class RoomsRepository:Repository {
    var patchObjectResponse: ((Result<Room>) -> Void)?

    typealias T = Room

    var baseClass: String = "room"

    var getObjectsResponse: ((ListResult<Room>) -> Void)?

    fileprivate var setSceneActiveResponse: ResultResponse?

}
