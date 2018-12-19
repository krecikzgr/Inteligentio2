//
//  CodableExtension.swift
//  Inteligentio2
//
//  Created by Adrian on 18/12/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
