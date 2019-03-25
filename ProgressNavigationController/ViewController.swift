//
//  ViewController.swift
//  ProgressNavigationController
//
//  Created by Ryan Han on 2/5/19.
//  Copyright © 2019 Ryan Han. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .default }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .portrait }
    
    @IBOutlet fileprivate var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let random = arc4random_uniform(9999)
        let number = String(random)
        button.setTitle(number, for: .normal)
        navigationItem.title = String(number)
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
    }
    
    @IBAction fileprivate func didSelectButton() {
        let vc = FeatureViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

