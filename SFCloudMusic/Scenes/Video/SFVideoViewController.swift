//
//  SFVideoViewController.swift
//  RXDemo
//
//  Created by 沈海超 on 2020/1/18.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import SFCloudMusicFunctionKit
class SFVideoViewController: UIViewController, BindableType, CycleScrollViewDelegate {
    
    var viewModel: SFVideoViewModel!
    
    var cycleView: SFCycleScrollView1!
    private let images = ["dis_main_cycle1","dis_main_cycle2","dis_main_cycle3","dis_main_cycle4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cycleView = SFCycleScrollView1(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: 200))
        cycleView.delegate = self
        cycleView.rollingEnable = true
        view.addSubview(cycleView)
    }

    /// 设置图片数量
    func cycleImageCount() -> Int {
        return images.count
    }
    
    /// 设置显示的图片
    func cycleImageView(_ imageView: UIImageView, index: Int) {
        imageView.image = UIImage(named: images[index])
    }
    
    /// 点击图片，返回下标
    func cycleImageViewClick(_ index: Int) {
        print(index)
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = UIColor.white
//        
//    }
//    

    func bindViewModel() {
        
    }
}
