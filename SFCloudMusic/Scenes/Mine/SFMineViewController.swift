//
//  SFMineViewController.swift
//  RXDemo
//
//  Created by 沈海超 on 2020/1/18.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import QTEventBus

class SFMineViewController: UIViewController, BindableType {

    var viewModel: SFMineViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribeNotification("clickNotification")?.next({ (event) in
            print("刷新界面")
        })
        
        subscribeSharedBus(SFDemoClass.self)?.next({ (event) in
            guard let event  = event as? SFDemoClass else {
                return
            }
            print(event.count)
        })
        
        subscribeSharedBus(ofJSON: "EventKey")?.next({ (event) in
            print("收到的数据：\(event?.data)")
        })
        
    }
    

    func bindViewModel() {
        
    }

}
