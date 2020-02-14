 //
//  LoginViewController.swift
//  RXDemo
//
//  Created by Alex.Shen on 1/14/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Action
class LoginViewController: UIViewController, BindableType {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    var viewModel: LoginViewModel!
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self)


        
    }
    
    func bindViewModel() {
        loginButton.rx.tap
            .bind(to: viewModel.input.loginTrigger)
            .disposed(by: disposeBag)
    }
   
}
