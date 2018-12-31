//
//  RequestBuilder.swift
//  Inteligentio2
//
//  Created by Adrian on 29/12/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

class RequestURLBuilder {
    var address: URL? {
        get {
            return self.compontents.url
        }
    }

    var compontents = URLComponents()

    init (baseAddress: String, port: Int = 8080) {
        compontents.scheme = "http"
        compontents.host = baseAddress
        compontents.queryItems = []
        compontents.port = port
    }

    @discardableResult
    func withBaseClass(baseClass: String) -> RequestURLBuilder {
        self.compontents.path = "/\(baseClass)"
        return self
    }

    @discardableResult
    func withId(id: Int) -> RequestURLBuilder {
        self.compontents.path += "/\(id)"
        return self
    }

    @discardableResult
    func withPage(page: Int = 0) -> RequestURLBuilder {
        let component = URLQueryItem(name: "page", value: String(page))
        self.compontents.queryItems?.append(component)
        return self
    }

    func withSize(size: Int = 0) -> RequestURLBuilder {
        let item = URLQueryItem(name: "size", value: String(size))
        self.compontents.queryItems?.append(item)
        return self
    }
}
