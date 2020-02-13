//
//  HomeTabCoordinator.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import XCoordinator

enum HomeRoute: Route {
    case news
    case userList
}

class HomeTabCoordinator: TabBarCoordinator<HomeRoute> {

    convenience init() {
        let discoverCoordinator = DiscoverCoordinator()
        discoverCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)

        let videoCoordinator = VideoCoordinator()
        videoCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)

        let mineCoordinator = MineCoordinator()
        mineCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let cloudVillageCoordinator = CloudVillageCoordinator()
        cloudVillageCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let accountCoordinator = AccountCoordinator()
        accountCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        self.init(discoverRouter: discoverCoordinator.strongRouter, videoRouter: videoCoordinator.strongRouter, mineRouter:mineCoordinator.strongRouter, cloudVillage: cloudVillageCoordinator.strongRouter, accountRouter: accountCoordinator.strongRouter)
    }

    init(discoverRouter: StrongRouter<DiscoverRoute>,
         videoRouter: StrongRouter<VideoRoute>, mineRouter: StrongRouter<MineRoute>, cloudVillage: StrongRouter<CloudVillageRoute>, accountRouter: StrongRouter<AccountRoute>) {
        super.init(tabs: [discoverRouter, videoRouter, mineRouter, cloudVillage, accountRouter], select: discoverRouter)
    }

}
