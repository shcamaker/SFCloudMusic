//
//  SFUserResult.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/3/5.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Foundation

struct SFUserResult: Codable {
    let userId: String
    let accessToken: String
    let refreshToken: String
    
//    enum keys: String, CodingKey {
//        case userID = "userId"
//        case accessToken
//        case refreshToken
//    }
    func toAuthenticatedUser() -> SFAuthenticatedUser {
         return SFAuthenticatedUser(userID: userId, accessToken: accessToken, refreshToken: refreshToken)
    }
}
