//
//  Debug.swift
//  ProgressNavigationController
//
//  Created by Ryan Han on 3/22/19.
//  Copyright © 2019 Ryan Han. All rights reserved.
//

import Foundation

func dLog(_ items: Any..., file: String = #file, line: Int = #line, function: String = #function) {
    var str: String = ""
    if let f = file.components(separatedBy: "/").last {
        str = "[\(f)][\(function)][\(line)]"
    } else {
        str = "[\(function)][\(line)]"
    }
    
    for item in items {
        str = str + " " + String(describing: item)
    }
    
    #if DEBUG
    print(NSDate(), str)
    #endif
}
