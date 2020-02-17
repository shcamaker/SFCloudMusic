//
//  SFDiscoverViewModel.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Action
import RxSwift
import XCoordinator

class SFDiscoverViewModel: NSObject {
    var items: Observable<[SFBaseCellModel]>
    
    private let router: UnownedRouter<DiscoverRoute>
    
    init(router: UnownedRouter<DiscoverRoute>) {
        self.router = router
        
        self.items = Observable.just([SFDiscoverCycleScrollCellModel(withIdentifier: "SFDiscoverCycleScrollCell"),SFDiscoverServicesCellModel(withIdentifier: "SFDiscoverServicesCell")])
    }
    
    
}
