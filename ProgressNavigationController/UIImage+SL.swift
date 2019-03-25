//
//  UIImage+SL.swift
//  ProgressNavigationController
//
//  Created by Ryan Han on 3/4/19.
//  Copyright © 2019 Ryan Han. All rights reserved.
//

import UIKit

extension UIImage {
    open class func image(fromColor color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        let img = image(fromColor: color, rect: rect)
        return img
    }
    
    open class func image(fromColor color: UIColor, rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return img!
    }
}
