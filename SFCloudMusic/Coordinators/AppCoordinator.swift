//
//  AppCoordinator.swift
//  RXDemo
//
//  Created by Alex.Shen on 1/7/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import XCoordinator


enum AppRoute: Route {
    case login
    case homeTab

}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    init() {
        super.init(initialRoute: .login)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
           switch route {
           case .login:
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               guard var viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
                return .none()
               }
               let viewModel = LoginViewModelImpl(router: unownedRouter)
               viewController.bind(to: viewModel)
               print(viewController)
               return .push(viewController)
           case .homeTab:
               return .present(HomeTabCoordinator())
        }
    }
            
}
