//
//  SFDiscoverCycleScrollCell.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/15.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import SFCloudMusicFunctionKit
class SFDiscoverCycleScrollCell: SFBaseTableViewCell {
    
    
    let cycleView: SFCycleScrollView = SFCycleScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150))
    
    override func buildUI() {
        contentView.addSubview(cycleView)
        cycleView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            cycleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            cycleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            cycleView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            cycleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func bindViewModel() {
        guard let viewModel = viewModel as? SFDiscoverCycleScrollCellModel else {
            return
        }
        
    }


}
