//
//  CTMediator+Login.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/23.
//  Copyright © 2020 沈海超. All rights reserved.
//

import CTMediator
import RxSwift

let loginTargetName = "Login"
let loginViewControllerActionName = "loginViewController"

extension CTMediator {
   @objc public func loginViewController(loginBlock: Any) -> UIViewController? {
        let params = ["callback" : loginBlock] as [AnyHashable:Any]
         let viewController = self.performTarget(loginTargetName, action: loginViewControllerActionName, params: params, shouldCacheTarget: false) as? UIViewController
    
        return viewController
    }
    
    
    
}
