//
//  CustomButton.swift
//  ProgressNavigationController
//
//  Created by Ryan Han on 3/4/19.
//  Copyright © 2019 Ryan Han. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    private func didLoad() {
        setBackgroundImage(UIImage.image(fromColor: .green), for: .normal)
        setBackgroundImage(UIImage.image(fromColor: .gray), for: .disabled)
        setBackgroundImage(UIImage.image(fromColor: UIColor.green.withAlphaComponent(0.5)), for: .highlighted)
    }
    
}

extension UIControl.State {
    static var forceTouch = UIControl.Event(rawValue: 1 << 21)
    static var longPress = UIControl.Event(rawValue: 1 << 22)
    static var loading = UIControl.Event(rawValue: 1 << 23)
    static var done = UIControl.Event(rawValue: 1 << 24)
}
