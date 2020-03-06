//
//  SFVideoViewController.swift
//  RXDemo
//
//  Created by 沈海超 on 2020/1/18.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import QTEventBus

class SFVideoViewController: UIViewController, BindableType {
    
    var viewModel: SFVideoViewModel!
    
   var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func click(_ sender: Any) {
        count += 1
        SFProvider.shard.updateAccessToken(newToken: "\(SFProvider.shard.token)++++\(count)")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "clickNotification"), object: nil)
        
    }
    
   
    @IBAction func propertyClick(_ sender: Any) {
        count += 1
        let event = SFDemoClass()
        QTEventBus<AnyObject>.shared.dispatch(event)
        event.count = count
    }
    
    @IBAction func dispatchJson(_ sender: Any) {
        let event = QTJsonEvent(id: "EventKey", jsonObject: ["alex":"iosDeveloper"])
        QTEventBus<AnyObject>.shared.dispatch(event)
    }
    
    
    
    func bindViewModel() {
        
    }
}
