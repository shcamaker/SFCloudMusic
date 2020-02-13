//
//  LoginViewModel.swift
//  RXDemo
//
//  Created by Alex.Shen on 1/14/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import RxSwift
import XCoordinator

protocol LoginViewModelInput {
    var loginTrigger: AnyObserver<Void> { get }
}

protocol LoginViewModelOutput {}

protocol LoginViewModel {
    var input: LoginViewModelInput { get }
    var output: LoginViewModelOutput { get }
}

extension LoginViewModel where Self: LoginViewModelInput & LoginViewModelOutput {
    var input: LoginViewModelInput { return self }
    var output: LoginViewModelOutput { return self }
}
