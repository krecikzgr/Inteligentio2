//
//  Results.swift
//  Inteligentio2
//
//  Created by Adrian on 12/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

public enum ListResult<T> {
    case success([T])
    case failure(Error)
}

public enum Result<T> {
    case success(T)
    case failure(Error)
}
