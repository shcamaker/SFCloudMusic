//
//  SFUserService.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/3/5.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Foundation
import RxSwift
import Moya

struct SFUserService: SFUserServiceProtocol {
    private let disposeBag = DisposeBag()
    
    func login(withEmail email: String, password: String) -> Observable<SFAuthenticatedUser> {
        return Observable<SFAuthenticatedUser>.create { observer -> Disposable in
//            let endpointClosure = { (target: SFLoginAPI) -> Endpoint in
//                let url = URL(target: target).absoluteString
//                return Endpoint(url: url, sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, task: target.task, httpHeaderFields: target.headers)
//            }
            let endpointClosure = { (target: SFLoginAPI) -> Endpoint in
                 let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)

                switch target {
                case .login(email: _, password: _):
                    return defaultEndpoint
                default:
                    return defaultEndpoint.adding(newHTTPHeaderFields: ["AUTHENTICATION_TOKEN": ""])
                }
            }
            
            
            let provider = MoyaProvider<SFLoginAPI>(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub)
            return provider.rx.request(.login(email: "Shen@111.com", password: "123456a")).subscribe { (event) in
                switch event {
                case let .success(response):
                    let decoder = JSONDecoder()
                    let loginInfo = try? decoder.decode(SFloginInfo.self, from: response.data)
                    guard let user = loginInfo?.data.toAuthenticatedUser() else {
                        return 
                    }
                    observer.onNext(user)
                case let .error(error):
                    observer.onError(error)
                }
            }
        }
        
    }
}
