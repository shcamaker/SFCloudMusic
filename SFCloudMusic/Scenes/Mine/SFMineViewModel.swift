//
//  SFMineViewModel.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/17.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Action
import RxSwift
import XCoordinator

class SFMineViewModel: NSObject {
    private let router: UnownedRouter<MineRoute>
    
    init(router: UnownedRouter<MineRoute>) {
        self.router = router
        
    }
}
