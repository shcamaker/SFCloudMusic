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
        cycleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cycleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        cycleView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cycleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    override func bindViewModel() {
        guard let viewModel = viewModel as? SFDiscoverCycleScrollCellModel else {
            return
        }
        
    }


}
