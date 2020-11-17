//
//  DiscoverCollectionReusableView.swift
//  SmartNews
//
//  Created by 苑伟 on 2017/6/23.
//  Copyright © 2017年 苑伟. All rights reserved.
//

import UIKit

class DiscoverHeaderReusableView: UICollectionReusableView {
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel.textColor = BaseColor.BlackColor
        return titleLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(15)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DiscoverFooterReusableView: UICollectionReusableView {
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = BaseColor.BlueColor
        titleLabel.textAlignment = .right
        titleLabel.text = "Show all trending >"
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-10)
            make.bottom.equalTo(self.snp.bottom).offset(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


