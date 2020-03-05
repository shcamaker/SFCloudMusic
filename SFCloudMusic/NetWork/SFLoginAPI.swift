//
//  SFLoginAPI.swift
//  SFCloudMusic
//
//  Created by Alex.Shen on 3/5/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Foundation
import Moya

enum SFLoginAPI {
    case login(email: String, password: String)
    case other
}

extension SFLoginAPI: TargetType {
    var baseURL: URL { return URL(string: "http://10.200.11.144:3000/api/")! }
    var path: String {
        switch self {
        case .login:
            return "emailSignin"
        case .other:
            return "other"
        }
    }
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .other:
            return .get
        }
    }
    var task: Task {
        switch self {
        case let .login(email, password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .other:
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .login:
             let path = Bundle.main.path(forResource: "loginjson", ofType: "json")
             let url = URL(fileURLWithPath: path!)
             guard let data = try? Data(contentsOf: url) else {
                return "Half measures are as bad as nothing at all.".utf8Encoded
             }
            
            return data
        case .other:
            return "other.".utf8Encoded
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    
    
}
// MARK: - Helpers
private extension String {

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
