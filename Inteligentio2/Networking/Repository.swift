//
//  Repository.swift
//  Inteligentio2
//
//  Created by Adrian on 12/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import Alamofire

class ApiResult:NSObject, Codable {
    var success:Bool?
    var message:String?
    var statusCode:Int?
}

typealias ResultResponse = (_ result: Result<ApiResult>) -> Void

protocol Repository:class {
    associatedtype T:Codable
    typealias ObjectResponse = (_ objects: ListResult<T>) -> Void
    var baseClass:String { get set }


    //TODO: IMPLEMENT CRUD OPERATIONS


    var getObjectsResponse: ObjectResponse? { get set }
}


extension Repository {
    func getAll(baseAddress:String, page:Int, size:Int, result: @escaping ObjectResponse) {
        let request = Alamofire.request(self.buildUrl(baseAdders: baseAddress), method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:]).responseJSON { response in
            self.getObjectsResponse = result
            guard response.error == nil,
                let data = response.data else {
                self.getObjectsResponse?(.failure(response.error ?? NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Serialization error"])))
                return
            }
            let decoder = JSONDecoder()
            do {
                let objectsArray = try decoder.decode(BaseListResponse<T>.self, from: data)
                self.getObjectsResponse?(.success(objectsArray))
            }
            catch let error {
                self.getObjectsResponse?(.failure(response.error ?? NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data decoding Error \(error)"])))
            }
        }
    }

    fileprivate func buildUrl(baseAdders:String)->String {
        print("requestURL: \(baseAdders + baseClass)")
        return baseAdders + baseClass;
    }

    fileprivate func unwrap(data:Data) {

    }
}
