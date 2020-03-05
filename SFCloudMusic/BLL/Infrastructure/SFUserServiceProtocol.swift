//
//  SFUserServiceProtocol.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/3/5.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Foundation
import RxSwift

protocol SFUserServiceProtocol {
    func login(withEmail email: String, password: String) -> Observable<SFAuthenticatedUser>
}
