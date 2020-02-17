//
//  SFMineCoordinator.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import XCoordinator

enum MineRoute: Route {
    case mineMain
}
class SFMineCoordinator: NavigationCoordinator<MineRoute> {
    override init(rootViewController: NavigationCoordinator<RouteType>.RootViewController = .init(), initialRoute: RouteType? = nil) {
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.mineMain)
    }
    
    override func prepareTransition(for route: MineRoute) -> NavigationTransition {
           switch route {
           case .mineMain:
               let storyboard = UIStoryboard(name: "Mine", bundle: nil)
               guard var viewController = storyboard.instantiateViewController(withIdentifier: "SFMineViewController") as? SFMineViewController else {
                  return .none()
               }
               let viewModel = SFMineViewModel(router: unownedRouter)
               viewController.bind(to: viewModel)
               return .push(viewController)
           }
       }
}
