//
//  SFVideoViewModel.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/16.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Action
import RxSwift
import XCoordinator

class SFVideoViewModel: NSObject {
    private let router: UnownedRouter<VideoRoute>
    
    init(router: UnownedRouter<VideoRoute>) {
        self.router = router
        
    }
}
