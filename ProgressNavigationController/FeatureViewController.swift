//
//  ContainerViewController.swift
//  ProgressNavigationController
//
//  Created by Ryan Han on 3/22/19.
//  Copyright © 2019 Ryan Han. All rights reserved.
//

import UIKit
import Pulley
import SnapKit

class FeatureViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let container = container else { return .default }
        guard container.drawerPosition == .partiallyRevealed else { return .lightContent }
        return .default
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return .all
        } else {
            return .portrait
        }
    }
    
    fileprivate var container: PulleyViewController?
    fileprivate let contentViewController = ContentViewController()
    fileprivate let detailViewController = DrawerViewController()
    fileprivate let defaultDrawerCornerRadius: CGFloat = 13
    fileprivate let titleLabel = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        /*
         Transfor won't work if titleLabel is set as navigationItem.titleView directly.
         It must be put on a container view and the container must be set as a titleView.
         */
        let aView = UIView(frame: .zero)
        titleLabel.text = "RANDOM TITLE"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        aView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        navigationItem.titleView = aView
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            container = PulleyViewController(contentViewController: contentViewController,
                                             drawerViewController: detailViewController)
            guard let container = container else { return }
            addChild(container)
            view.addSubview(container.view)
            container.didMove(toParent: self)
            container.view.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            
            container.drawerTopInset = 0
            container.initialDrawerPosition = .partiallyRevealed
            container.drawerCornerRadius = defaultDrawerCornerRadius
            container.delegate = self
            container.setNeedsSupportedDrawerPositionsUpdate()
            
        } else {
            addChild(contentViewController)
            view.addSubview(contentViewController.view)
            contentViewController.didMove(toParent: self)
            contentViewController.view.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.width.equalTo(250)
            }
            
            addChild(detailViewController)
            view.addSubview(detailViewController.view)
            detailViewController.didMove(toParent: self)
            detailViewController.view.snp.makeConstraints { (make) in
                make.left.equalTo(contentViewController.view.snp.right)
                make.right.equalToSuperview()
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
    }
}

extension FeatureViewController: PulleyDrawerViewControllerDelegate {
    func drawerPositionDidChange(drawer: PulleyViewController, bottomSafeArea: CGFloat) {
        if container?.drawerPosition == .partiallyRevealed {
            container?.drawerCornerRadius = defaultDrawerCornerRadius
        } else {
            container?.drawerCornerRadius = 0
        }
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func makeUIAdjustmentsForFullscreen(progress: CGFloat, bottomSafeArea: CGFloat) {
        titleLabel.transform = CGAffineTransform(translationX: 0, y: 20 * (1 - progress))
        navigationController?.navigationBar.barTintColor = UIColor(red: 1-progress, green: 1-progress, blue: 1-progress, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor(red: progress, green: progress, blue: 1, alpha: 1)
    }
}
