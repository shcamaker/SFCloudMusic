//
//  SFUserManager.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/3/5.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

struct SFUserManager {
    
    let userService: SFUserServiceProtocol
    init(userService: SFUserServiceProtocol) {
        self.userService = userService
    }
    
    
}
