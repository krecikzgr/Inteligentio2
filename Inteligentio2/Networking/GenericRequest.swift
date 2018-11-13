//
//  GenericRequest.swift
//  Inteligentio2
//
//  Created by Adrian on 11/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager {

    static let sharedInstance = RequestManager();
    var isAuthenticated:Bool = false
    var requests:[GenericRequest] = []

    func authenticate(request:GenericRequest) {

    }
}

typealias ErrorResponse = (Error?) -> Void
typealias SuccessResponse = (Data?) -> Void



class GenericRequest {

    var apiAddress:String = ""
    var headers:[String:String] = [:]
    var method: HTTPMethod = .get
    var parameters:[String:String] = [:]
    var onError: ErrorResponse?
    var onSuccess: SuccessResponse?

    func performRequest(baseAddress:String){
        let request = Alamofire.request(self.buildUrl(baseAdders: baseAddress), method: self.method, parameters: self.parameters, encoding: self.getEncoding(), headers: self.headers).responseJSON { response in
            guard response.error == nil else {
                if let errorResponse = self.onError  {
                    errorResponse(response.error)
                }
                return
            }
            guard let onSuccess = self.onSuccess else {
                return
            }
            onSuccess(response.data)
        }
    }

    fileprivate func buildUrl(baseAdders:String)->String {
        print("requestURL: \(baseAdders + apiAddress)")
        return baseAdders + apiAddress;
    }

    private func getEncoding()->ParameterEncoding {
        switch self.method.rawValue {
        case HTTPMethod.get.rawValue:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}

