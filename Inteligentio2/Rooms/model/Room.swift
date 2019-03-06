//
//  Room.swift
//  Inteligentio2
//
//  Created by Adrian on 06/03/2019.
//  Copyright © 2019 AdrianKaleta. All rights reserved.
//

import Foundation

class Room: BaseObject {
    var description: String?
    var name: String?
    var isActive: Bool?
    var tableName: String?
    var id: Int?
    var sensors:[Sensor] = []
}
