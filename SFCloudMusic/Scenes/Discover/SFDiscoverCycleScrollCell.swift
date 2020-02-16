//
//  SFDiscoverCycleScrollCell.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/15.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

class SFDiscoverCycleScrollCell: SFBaseTableViewCell {
    
    
    let cycleView: SFCycleScrollView = SFCycleScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150))
    
    override func buildUI() {
        contentView.addSubview(cycleView)
    }
    
    override func bindViewModel() {
        guard let viewModel = viewModel as? SFDiscoverCycleScrollCellModel else {
            return
        }
        
    }


}
