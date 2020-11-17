//
//  DisCoverCollectionViewCell.swift
//  SmartNews
//
//  Created by 苑伟 on 2017/6/23.
//  Copyright © 2017年 苑伟. All rights reserved.
//

import UIKit

class DisCoverCollectionViewCell: UICollectionViewCell {
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.init(hex: 0xefefef)
        bgView.layer.cornerRadius = 3.0
        bgView.layer.masksToBounds = true
        return bgView
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        return iconImageView
    }()
    
    lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        contentLabel.textColor = BaseColor.DarkGrayColor
        contentLabel.textAlignment = .center
        contentLabel.numberOfLines = 3
        return contentLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bgView)
        bgView.addSubview(iconImageView)
        bgView.addSubview(contentLabel)
        
        bgView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(80)
        }
        
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(bgView.snp.left).offset(10)
            make.width.height.equalTo(60)
            make.centerY.equalTo(bgView.snp.centerY)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(bgView.snp.centerY)
            make.left.equalTo(iconImageView.snp.right).offset(3)
            make.right.equalTo(bgView.snp.right).offset(-3)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class DiscoverItemCollectionCell: UICollectionViewCell {
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = BaseColor.BackGroundColor
        bgView.layer.cornerRadius = 3.0
        bgView.layer.masksToBounds = true
        return bgView
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        return iconImageView
    }()
    
    lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.font = UIFont.systemFont(ofSize: 12)
        contentLabel.textColor = BaseColor.BlackColor
        contentLabel.textAlignment = .center
        return contentLabel
    }()
    
    lazy var badgeLabel: UILabel = {
        let badgeLabel = UILabel()
        badgeLabel.font = UIFont.boldSystemFont(ofSize: 12)
        badgeLabel.textColor = BaseColor.GrayColor
        return badgeLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bgView)
        bgView.addSubview(iconImageView)
        bgView.addSubview(contentLabel)
        bgView.addSubview(badgeLabel)
        
        badgeLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(5)
        }
        
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(5)
            make.left.right.equalTo(0)
            make.height.equalTo(90)
        }
        
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(bgView.snp.top).offset(10)
            make.width.height.height.equalTo(50)
            make.centerX.equalTo(bgView.snp.centerX)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconImageView.snp.bottom).offset(10)
            make.centerX.equalTo(bgView.snp.centerX)
            make.left.equalTo(bgView.snp.left).offset(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DiscoverCategoriesCollectionCell: UICollectionViewCell {
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = BaseColor.SeperatorColor
        return lineView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = BaseColor.GrayColor
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(lineView)
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.left.equalTo(contentView.snp.left).offset(15)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.top.right.equalTo(0)
            make.height.equalTo(0.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

