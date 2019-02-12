//
//  Repository.swift
//  Inteligentio2
//
//  Created by Adrian on 12/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import Alamofire

class ApiResult: NSObject, Codable {
    var success: Bool?
    var message: String?
    var statusCode: Int?
}

protocol BaseObject: Codable {
    var tableName: String? { get set }
    var id: Int? { get set }
}

typealias ResultResponse = (_ result: Result<ApiResult>) -> Void

protocol Repository: class {
    associatedtype T: BaseObject
    typealias ListResponse = (_ objects: ListResult<T>) -> Void
    typealias ObjectResponse = (_ objects: Result<T>) -> Void
    var baseClass: String { get set }
}


extension Repository {
    func sendRequest(address: String, method: HTTPMethod, headers: HTTPHeaders, body: Parameters, result: @escaping ListResponse) {
        let request = Alamofire.request(address, method: method, parameters: body, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            guard response.error == nil,
                let data = response.data else {
                    result(.failure(response.error ?? NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Serialization error"])))
                    return
            }
            let decoder = JSONDecoder()
            do {
                let dataString = String(data: data, encoding: .utf8)
                print("::RETURNED STRING \(dataString)")
                let objectsArray = try decoder.decode(ResponseList<T>.self, from: data)
                objectsArray.statusCode = response.response?.statusCode
                if (200 ... 299).contains(response.response?.statusCode ?? 400) {
                    result(.success(objectsArray))
                } else {
                    result(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Request error \n CODE: \(response.response?.statusCode) + \(objectsArray.message) "])))
                }
            }
            catch let error {
                result(.failure(response.error ?? NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data decoding Error \(error)"])))
            }
        }
    }

    func sendRequest(address: String, method: HTTPMethod, headers: HTTPHeaders, body: Parameters, result: @escaping ObjectResponse) {
        let request = Alamofire.request(address, method: method, parameters: body, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            guard response.error == nil,
                let data = response.data else {
                    result(.failure(response.error ?? NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Serialization error"])))
                    return
            }
            let decoder = JSONDecoder()
            do {
                let objectsArray = try decoder.decode(ResponseObejct<T>.self, from: data)
                objectsArray.statusCode = response.response?.statusCode
                if (200 ... 299).contains(response.response?.statusCode ?? 400) {
                    result(.success(objectsArray))
                } else {
                    result(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Request error \n CODE: \(response.response?.statusCode) + \(objectsArray.message) "])))
                }
            }
            catch let error {
                result(.failure(response.error ?? NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data decoding Error \(error)"])))
            }
        }
    }

    func getAll(baseAddress: String, page: Int, size: Int, result: @escaping ListResponse) {
        let requestBuilder = RequestURLBuilder(baseAddress: baseAddress, port: 3001)
            .withSize(size: size)
            .withPage(page: page)
            .withBaseClass(baseClass: self.baseClass)
        self.sendRequest(address: requestBuilder.address?.absoluteString ?? "", method: .get, headers: [:], body: [:], result: result)
    }

    func update(baseAddress: String, object: T, result: @escaping ObjectResponse) {
        let requestBuilder = RequestURLBuilder(baseAddress: baseAddress, port: 3001)
            .withBaseClass(baseClass: self.baseClass)
            .withId(id: object.id ?? 0)
        do {
            let encodedJson = try object.asDictionary()
            self.sendRequest(address: requestBuilder.address?.absoluteString ?? "", method: .patch, headers: [:], body: encodedJson, result: result)
        } catch let error {
           result(.failure( NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data decoding Error \(error)"])))
        }
    }
}


