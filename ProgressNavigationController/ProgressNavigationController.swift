//
//  ProgressNavigationController.swift
//  ProgressNavigationController
//
//  Created by Ryan Han on 2/5/19.
//  Copyright © 2019 Ryan Han. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ProgressNavigationController: UINavigationController {
    let progressView = UIProgressView(progressViewStyle: .bar)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(progressView)
        progressView.snp.makeConstraints { (make) in
            make.top.equalTo(navigationBar.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        progressView.progress = 0
    }
}
