//
//  DrawerViewController.swift
//  ProgressNavigationController
//
//  Created by Ryan Han on 3/22/19.
//  Copyright © 2019 Ryan Han. All rights reserved.
//

import UIKit
import Pulley

class DrawerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3)
    }
}

extension DrawerViewController: PulleyDrawerViewControllerDelegate {
    func supportedDrawerPositions() -> [PulleyPosition] {
        return [.partiallyRevealed, .open]
    }
    
    func partialRevealDrawerHeight(bottomSafeArea: CGFloat) -> CGFloat {
        return 130
    }
}
