//
//  DeferredOrientationNavigationController.swift
//  Surfline
//
//  Created by Chris Lavender on 6/28/16.
//  Copyright © 2016 Surfline. All rights reserved.
//

import UIKit

/**
 Sometimes you want to child root VC's to dictate the preferred orientations
 */

class DeferredOrientationNavigationController: UINavigationController {
    override var shouldAutorotate: Bool {
        guard let rootVC = viewControllers.last else {
            return super.shouldAutorotate
        }
        return rootVC.shouldAutorotate
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let rootVC = viewControllers.last else {
            return super.supportedInterfaceOrientations
        }
        return rootVC.supportedInterfaceOrientations
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        guard let rootVC = viewControllers.last else {
            return super.preferredInterfaceOrientationForPresentation
        }
        return rootVC.preferredInterfaceOrientationForPresentation
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let rootVC = viewControllers.last else {
            return super.preferredStatusBarStyle
        }
        return rootVC.preferredStatusBarStyle
    }

    override var prefersStatusBarHidden: Bool {
        guard let rootVC = viewControllers.last else {
            return super.prefersStatusBarHidden
        }
        return rootVC.prefersStatusBarHidden
    }
}
