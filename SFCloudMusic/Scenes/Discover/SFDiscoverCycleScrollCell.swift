//
//  SFDiscoverCycleScrollCell.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/15.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

class SFDiscoverCycleScrollCell: SFBaseTableViewCell {
    
    @IBOutlet weak var testLabel: UILabel!
    
    override func buildUI() {
        
    }
    
    override func bindViewModel() {
        guard let viewModel = viewModel as? SFDiscoverCycleScrollCellModel else {
            return
        }
        testLabel.text = viewModel.name
    }


}
