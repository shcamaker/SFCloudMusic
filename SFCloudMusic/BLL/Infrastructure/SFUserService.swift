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
            return SFProvider.request(target: .login(email: email, password: password), success: { (response) in
                let decoder = JSONDecoder()
                let loginInfo = try? decoder.decode(SFloginInfo.self, from: response.data)
                guard let user = loginInfo?.data.toAuthenticatedUser() else { return }
                SFProvider.shard.updateAccessToken(newToken: user.accessToken)//保存token
                observer.onNext(user)
                observer.onCompleted()
            }) { (error) in
                observer.onError(error)
            }
        }
    }
    
   
}
