//
//  VideoCoordinator.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import XCoordinator


enum VideoRoute: Route {
    case discoverMain
}
class VideoCoordinator: NavigationCoordinator<VideoRoute> {
    override init(rootViewController: NavigationCoordinator<RouteType>.RootViewController = .init(), initialRoute: RouteType? = nil) {
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.discoverMain)
    }
    
    override func prepareTransition(for route: VideoRoute) -> NavigationTransition {
           switch route {
           case .discoverMain:
               let storyboard = UIStoryboard(name: "Video", bundle: nil)
               guard var viewController = storyboard.instantiateViewController(withIdentifier: "VideoViewController") as? VideoViewController else {
                  return .none()
               }
               let viewModel = SFVideoViewModel(router: unownedRouter)
               viewController.bind(to: viewModel)
               return .push(viewController)
           }
       }
    
}
