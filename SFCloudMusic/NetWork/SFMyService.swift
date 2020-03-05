//
//  SFMyService.swift
//  SFCloudMusic
//
//  Created by Alex.Shen on 3/5/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Foundation
import Moya

enum SFMyService {
    case login(email: String, password: String)
}

extension SFMyService: TargetType {
    var baseURL: URL { return URL(string: "http://10.200.11.144:3000/api/")! }
    var path: String {
        switch self {
        case .login:
            return "emailSignin"
        }
    }
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }
    var task: Task {
        switch self {
        case let .login(email, password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        }
    }
    var sampleData: Data {
        switch self {
        case .login:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    
    
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
