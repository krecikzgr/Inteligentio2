//
//  Results.swift
//  Inteligentio2
//
//  Created by Adrian on 12/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

public enum ListResult<T:Codable> {
    case success(ResponseList<T>)
    case failure(Error)
}

public enum Result<T:Codable> {
    case success(ResponseObejct<T>)
    case failure(Error)
}

public class BaseResponse: Codable {
    var message: String?
    var statusCode: Int?
    var errorDescription: String?
}

public class ResponseList<T:Codable>: Codable {
    var data: [T]?
    var message: String?
    var statusCode: Int?
    var errorDescription: String?
}

public class ResponseObejct<T:Codable>: Codable {
    var data: T?
    var message: String?
    var statusCode: Int?
    var errorDescription: String?
}
