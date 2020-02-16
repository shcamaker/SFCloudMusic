//
//  GitHubAPI.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/16.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class GitHubAPI{
    let URLSession: URLSession
    
    static let sharedAPI = GitHubAPI(
        URLSession: Foundation.URLSession.shared
    )
    
    init(URLSession: URLSession){
        self.URLSession = URLSession
    }
    
    func usernameAvailable(_ username: String) -> Observable<Bool>{
        let url = URL(string: "https://github.com/\(username.URLEscaped)")!
        let request = URLRequest(url: url)
        return self.URLSession.rx.response(request: request)
            .map{
                (response, _) in
                return response.statusCode == 404
            }
            .catchErrorJustReturn(false)
    }
    
    func register(_ username: String, password: String) -> Observable<Bool>{
        let registerResult = arc4random() % 5 == 0 ? false : true
        return Observable.just(registerResult)
                .delay(1.0, scheduler: MainScheduler.instance)  //延迟一秒
    }
}
