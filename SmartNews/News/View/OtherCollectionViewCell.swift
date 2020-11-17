//
//  OtherCollectionViewCell.swift
//  SmartNews
//
//  Created by XH on 2017/7/20.
//  Copyright © 2017年 苑伟. All rights reserved.
//

import UIKit

class OtherCollectionViewCell: UICollectionViewCell {
    
    lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        contentLabel.textColor = BaseColor.DarkGrayColor
        contentLabel.numberOfLines = 3
        return contentLabel
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.textColor = BaseColor.LightGrayColor
        return nameLabel
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.clipsToBounds = true
        iconImageView.contentMode = .scaleAspectFill
        return iconImageView
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = BaseColor.SeperatorColor
        return lineView
    }()
    
    lazy var vLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = BaseColor.SeperatorColor
        return lineView
    }()

    var model: TopViewDataModel? {
        didSet{
            contentLabel.text = model?.content
            nameLabel.text = model?.name
            iconImageView.kf.setImage(with: URL(string: (model?.imagePath)!))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(iconImageView)
        contentView.addSubview(contentLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(lineView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class OtherFirstCollectionViewCell: OtherCollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(vLineView)
        
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.width.equalTo(contentView.frame.size.width - 20)
            make.height.equalTo(80)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.left)
            make.top.equalTo(iconImageView.snp.bottom).offset(10)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentLabel.snp.left)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.height.equalTo(0.5)
        }
        
        vLineView.snp.makeConstraints { (make) in
            make.right.equalTo(0)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.width.equalTo(0.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class OtherSecondCollectionViewCell: OtherCollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(vLineView)
        
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.width.equalTo(contentView.frame.size.width - 20)
            make.height.equalTo(80)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.left)
            make.top.equalTo(iconImageView.snp.bottom).offset(10)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentLabel.snp.left)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.height.equalTo(0.5)
        }
        
        vLineView.snp.makeConstraints { (make) in
            make.right.equalTo(0)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.width.equalTo(0.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class OtherThirdCollectionViewCell: OtherCollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(lineView)
        
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.width.equalTo(120)
            make.height.equalTo(80)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(iconImageView.snp.left).offset(-10)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentLabel.snp.left)
            make.right.equalTo(iconImageView.snp.left).offset(-10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.height.equalTo(0.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

