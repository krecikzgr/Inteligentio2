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

class BaseObject: Codable {
    var tableName:String?
    var id:Int?
}

typealias ResultResponse = (_ result: Result<ApiResult>) -> Void

protocol Repository:class {
    associatedtype T:BaseObject
    typealias GetObjectsResponse = (_ objects: ListResult<T>) -> Void
    typealias PatchObjectResponse = (_ object: Result<T>) -> Void
    var baseClass:String { get set }


    //TODO: IMPLEMENT CRUD OPERATIONS
    var getObjectsResponse: GetObjectsResponse? { get set }
    var patchObjectResponse: PatchObjectResponse? {get set}
}


extension Repository {
    func getAll(baseAddress:String, page:Int, size:Int, result: @escaping GetObjectsResponse) {
        let request = Alamofire.request(self.buildUrl(baseAdders: baseAddress, size: size, page: page), method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:]).responseJSON { response in
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


    func patchObject(baseAddress:String, object:T, result: @escaping PatchObjectResponse) {
        let encoder = JSONEncoder()
        do {
            let encodedJson = try object.asDictionary()
            let url = self.patchUrl(baseAddress: baseAddress, id: object.id ?? 0)
            print("PATCH URL : \(url)")
            let request = Alamofire.request(url, method: .patch, parameters: encodedJson, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                switch response.result {
                case .failure(let error):
                    case .suc
                }
                print("PATCH RESPONSE: \(String(data: response.data!, encoding: .utf8))")
                self.patchObjectResponse = result
                guard response.error == nil,
                    let data = response.data else {
                        self.patchObjectResponse?(.failure(response.error ?? NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Serialization error"])))
                        return
                }
                let decoder = JSONDecoder()
                do {
                    let object = try decoder.decode(BaseResponse<T>.self, from: data)
                   self.patchObjectResponse?(.success(object))
                }
                catch let error {
                    self.getObjectsResponse?(.failure(response.error ?? NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data decoding Error \(error)"])))
                }
            }
        }
        catch let error {
            print(error.localizedDescription)
        }
    }

    fileprivate func patchUrl(baseAddress:String, id:Int)->String{
        return "\(baseAddress)" + "\(baseClass)" + "/\(id)"
    }

    fileprivate func buildUrl(baseAdders:String, size:Int = 0, page:Int = 0)->String {
        var address = baseAdders
        address += baseClass
        address += "?size="
        address += "\(size)"
        address += "&page="
        address += "\(page)"
        return address
    }

    fileprivate func unwrap(data:Data) {

    }
}
