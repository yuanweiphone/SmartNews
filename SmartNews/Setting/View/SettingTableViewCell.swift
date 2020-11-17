//
//  SettingTableViewCell.swift
//  SmartNews
//
//  Created by 苑伟 on 2017/6/24.
//  Copyright © 2017年 苑伟. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.textColor = BaseColor.DarkGrayColor
        return nameLabel
    }()

    lazy var tipLabel: UILabel = {
        let tipLabel = UILabel()
        tipLabel.font = UIFont.systemFont(ofSize: 14)
        tipLabel.textColor = BaseColor.DarkGrayColor
        return tipLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.accessoryType = .disclosureIndicator
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(tipLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        tipLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.right.equalTo(contentView.snp.right).offset(-25)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
