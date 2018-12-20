//
//  Results.swift
//  Inteligentio2
//
//  Created by Adrian on 12/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

public enum ListResult<T:Codable> {
    case success(BaseListResponse<T>)
    case failure(Error)
}

public enum Result<T:Codable> {
    case success(BaseResponse<T>)
    case failure(Error)
}

public class BaseResponse<T:Codable>: Codable {
    var message:String?
    var data:T?
    var statusCode:Int?
    var errorDescription:String?
}

public class BaseListResponse<T:Codable>: Codable {
    var message:String?
    var data:[T]?
}
