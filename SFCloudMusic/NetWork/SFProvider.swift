//
//  SFProvider.swift
//  SFCloudMusic
//
//  Created by Alex.Shen on 3/6/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class SFProvider {
   static let shard = SFProvider()
   var token = ""
    
   static func request(target: SFSeviceAPI, success: @escaping (Response)-> (), errorHandler: @escaping (Error)->()) -> Disposable {
        let endpointClosure = { (target: SFSeviceAPI) -> Endpoint in
             let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)

            switch target {
            case .login(email: _, password: _):
                return defaultEndpoint
            default:
                return defaultEndpoint.adding(newHTTPHeaderFields: ["AUTHENTICATION_TOKEN": SFProvider.shard.token])
            }
        }
        let provider = MoyaProvider<SFSeviceAPI>(endpointClosure: endpointClosure)//, stubClosure: MoyaProvider.immediatelyStub)
        return provider.rx.request(target).subscribe { (event) in
            switch event {
            case let .success(response):
                if response.statusCode == 401 { //token过期
                    //或者根据此接口返回的token更新，或者调用刷新token接口
                    SFProvider.shard.updateAccessToken(newToken: "newToken")
                    //刷新token后，重新发送此请求
                }
                success(response)
            case let .error(error):
                errorHandler(error)
            }
        }
    }
    func updateAccessToken(newToken: String) {
        token = newToken
    }
}
