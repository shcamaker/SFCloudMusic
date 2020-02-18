//
//  SFAlertKit.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/18.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

class SFAlertKit: NSObject {
    class func showAlert(title:String? = nil, message: String? = nil, style: UIAlertController.Style, confirmTitle: String, cancelTitle: String, confirmHandler: @escaping (()->()), cancelHandler: @escaping (()->())) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        if confirmTitle.count > 0 {
            alert.addAction(UIAlertAction(title: confirmTitle, style: .default, handler: { (_) in
                confirmHandler()
            }))
        }
        
        if cancelTitle.count > 0 {
            alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: { (_) in
                cancelHandler()
            }))
        }
        
        UIApplication.shared.windows[0].rootViewController?.present(alert, animated: true, completion: nil)
    }
}

