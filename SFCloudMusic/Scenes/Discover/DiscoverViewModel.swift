//
//  DiscoverViewModel.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Action
import RxSwift
import XCoordinator

class DiscoverViewModel: NSObject {

    private let router: UnownedRouter<DiscoverRoute>
    
    init(router: UnownedRouter<DiscoverRoute>) {
        self.router = router
    }
}
