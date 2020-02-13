//
//  LoginViewModelImpl.swift
//  RXDemo
//
//  Created by Alex.Shen on 1/14/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Action
import RxSwift
import XCoordinator

class LoginViewModelImpl: LoginViewModel, LoginViewModelInput, LoginViewModelOutput {
    private(set) lazy var loginTrigger = loginAction.inputs
    private let router: UnownedRouter<AppRoute>
    
    private lazy var loginAction = CocoaAction { [unowned self] in
        self.router.rx.trigger(.homeTab)
    }
    
    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }

}
