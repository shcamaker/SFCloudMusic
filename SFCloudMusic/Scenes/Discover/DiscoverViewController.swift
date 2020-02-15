//
//  DiscoverViewController.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Action

class DiscoverViewController: UIViewController, BindableType {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    var viewModel: DiscoverViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func bindViewModel() {
        viewModel.items.bind(to: tableView.rx.items) { tv, indexPath, model in
            var cell = tv.dequeueReusableCell(withIdentifier: String(describing: model.cellID)) as? SFBaseTableViewCell
            cell?.bind(to: model)
            return cell! 
        }.disposed(by: disposeBag)
    }
}
