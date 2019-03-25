//
//  SearchHeaderView.swift
//  ProgressNavigationController
//
//  Created by Ryan Han on 2/6/19.
//  Copyright © 2019 Ryan Han. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SearchHeaderView: UIView {
    private let titleLabel = UILabel(frame: .zero)
    let searchController = UISearchController(searchResultsController: nil)
    
    override var intrinsicContentSize: CGSize {
        layoutSubviews()
        let size = CGSize(width: frame.size.width,
                          height: searchController.searchBar.frame.maxY + 20)
        return size
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        titleLabel.text = "HEADER TITLE"
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
        }
        
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = true
        searchController.definesPresentationContext = true
        addSubview(searchController.searchBar)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchController.searchBar.frame = CGRect(x: 0,
                                                  y: titleLabel.frame.maxY + 20,
                                                  width: frame.size.width,
                                                  height: searchController.searchBar.frame.size.height)
    }
}
