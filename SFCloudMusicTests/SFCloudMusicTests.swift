//
//  SFCloudMusicTests.swift
//  SFCloudMusicTests
//
//  Created by 沈海超 on 2020/2/12.
//  Copyright © 2020 沈海超. All rights reserved.
//

import XCTest
import Moya
import RxSwift

@testable import SFCloudMusic

class SFCloudMusicTests: XCTestCase {
private let disposeBag = DisposeBag()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
     
       let endpointClosure = { (target: SFLoginAPI) -> Endpoint in
           let url = URL(target: target).absoluteString
           return Endpoint(url: url, sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, task: target.task, httpHeaderFields: target.headers)
       }
       let provider = MoyaProvider<SFLoginAPI>(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub)
       provider.rx.request(.login(email: "Shen@111.com", password: "123456a")).subscribe { (event) in
           switch event {
           case let .success(response):
               let decoder = JSONDecoder()
               let loginInfo = try? decoder.decode(SFloginInfo.self, from: response.data)
               let user = loginInfo?.data.toAuthenticatedUser()
               print(user?.accessToken)
           case let .error(error):
               print(error)
           }
       }.disposed(by: disposeBag)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
