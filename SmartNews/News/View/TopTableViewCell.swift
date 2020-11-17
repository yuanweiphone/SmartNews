//
//  TopTableViewCell.swift
//  Demo
//
//  Created by yuanwei on 2017/6/18.
//  Copyright © 2017年 com.boxiao. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class TopTableViewCell: UITableViewCell {
    
    var model: TopViewDataModel? {
        didSet{
            contentLabel.text = model?.content
            nameLabel.text = model?.name
            iconImageView.kf.setImage(with: URL(string: (model?.imagePath)!))
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        contentView.addSubview(contentLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(lineView)
        
        iconImageView.snp.makeConstraints { (make) in
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.width.equalTo(120)
            make.height.equalTo(80)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(10)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.right.equalTo(iconImageView.snp.left)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentLabel.snp.left)
            make.bottom.equalTo(iconImageView.snp.bottom)
            make.right.equalTo(iconImageView.snp.left)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.height.equalTo(0.5)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

}
