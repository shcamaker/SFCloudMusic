//
//  DiscoverCoordinator.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import XCoordinator

enum DiscoverRoute: Route {
    case discoverMain
    
}


class DiscoverCoordinator: NavigationCoordinator<DiscoverRoute> {
    override init(rootViewController: NavigationCoordinator<RouteType>.RootViewController = .init(), initialRoute: RouteType? = nil) {
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.discoverMain)
    }
    
    override func prepareTransition(for route: DiscoverRoute) -> NavigationTransition {
           switch route {
           case .discoverMain:
               let storyboard = UIStoryboard(name: "Discover", bundle: nil)
               guard var viewController = storyboard.instantiateViewController(withIdentifier: "DiscoverViewController") as? DiscoverViewController else {
                  return .none()
               }
               let viewModel = DiscoverViewModel(router: unownedRouter)
               viewController.bind(to: viewModel)
               return .push(viewController)
           }
       }
    
    
}
