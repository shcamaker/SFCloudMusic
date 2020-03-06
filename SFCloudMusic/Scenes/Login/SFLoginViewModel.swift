//
//  SFLoginViewModel.swift
//  RXDemo
//
//  Created by Alex.Shen on 1/14/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Action
import RxSwift

class SFLoginViewModel: NSObject {
    private(set) lazy var loginTrigger = loginAction.inputs
    
    var loginBlock:() -> ()
    
    var loginAction: Action<(String, String), SFAuthenticatedUser>
    
    init(loginBlock: @escaping () -> ()) {
        self.loginBlock = loginBlock
        
        let userManager = SFUserManager(userService: SFUserService())
        loginAction = Action { email, password in
            userManager.login(withEmail: "Shen@111.com", password: "123456a")
        }
            
        
    }

}
