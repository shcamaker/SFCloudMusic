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
    
    var ac =  CocoaAction(workFactory: { (void) -> Observable<Void> in
        return Observable.create { observer in
            observer.onCompleted()
            return Disposables.create()
        }
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self)

//        loginButton.rx.action = CocoaAction(workFactory: { (void) -> Observable<Void> in
//            return Observable.create { observer in
//                observer.onCompleted()
//                return Disposables.create()
//            }
//        })
        
    }
    
    func bindViewModel() {
        loginButton.rx.tap
            .bind(to: viewModel.input.loginTrigger)
            .disposed(by: disposeBag)
//       loginButton.rx.action = CocoaAction(workFactory: { (void) -> Observable<Void> in
//           return Observable.create { observer in
//               observer.onCompleted()
//               return Disposables.create()
//           }
//       })
    }
   
}
