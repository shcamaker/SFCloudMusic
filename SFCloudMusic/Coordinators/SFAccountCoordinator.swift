//
//  SFAccountCoordinator.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import XCoordinator

enum AccountRoute: Route {
    case accountMain
}
class SFAccountCoordinator: NavigationCoordinator<AccountRoute> {
    override init(rootViewController: NavigationCoordinator<RouteType>.RootViewController = .init(), initialRoute: RouteType? = nil) {
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.accountMain)
    }
    
    override func prepareTransition(for route: AccountRoute) -> NavigationTransition {
           switch route {
           case .accountMain:
               let storyboard = UIStoryboard(name: "Account", bundle: nil)
               guard var viewController = storyboard.instantiateViewController(withIdentifier: "SFAccountViewController") as? SFAccountViewController else {
                  return .none()
               }
               let viewModel = SFAccountViewModel(router: unownedRouter)
               viewController.bind(to: viewModel)
               return .push(viewController)
           }
       }
}
