//
//  UIColor+Addtions.swift
//  SmartNews
//
//  Created by 苑伟 on 2017/6/21.
//  Copyright © 2017年 苑伟. All rights reserved.
//


import UIKit

extension UIColor
{
    convenience init(hex: Int32) {
        let r = CGFloat(((hex & 0xFF0000) >> 16)) / 255.0
        let g = CGFloat(((hex & 0x00FF00) >> 8)) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    convenience init(_ red: Int, _ green: Int, _ blue: Int) {
        self.init(red: CGFloat(red) / 255.0,green: CGFloat(green) / 255.0,blue: CGFloat(blue) / 255.0,alpha: 1.0)
    }
}

struct BaseColor {
    /**
     用于重要级段落文字信息 标题信息
     */
    static let BlackColor = UIColor(hex: 0x000000)
    
    /**
     用于普通级段落文字 引导词
     */
    static let DarkGrayColor = UIColor(hex: 0x333333)
    
    /**
     用于普通级文字
     */
    static let GrayColor = UIColor(hex: 0x666666)
    
    /**
     用于辅助次要文字信息
     */
    
    static let LightGrayColor = UIColor(hex: 0x999999)
    
    /**
     用于分割线颜色
     */
    static let SeperatorColor = UIColor(hex: 0xe5e5e5)
    
    /**
     用于界面背景颜色
     */
    static let BackGroundColor = UIColor(hex: 0xf5f5f5)
    
    /**
     蓝色
     */
    static let BlueColor = UIColor(hex: 0x00a7ec)
    
    /**
     红色
     */
    static let RedColor = UIColor(hex: 0xe64c3c)
    
    /**
     橘色
     */
    static let OrangeColor = UIColor(hex: 0xec9810)
    
    /**
     绿色
     */
    static let GreenColor = UIColor(hex: 0x2dc76f)

    /**
     深蓝色
     */
    static let DarkBlueColor = UIColor(hex: 0x00a7ec)

    /**
     紫色
     */
    static let PurpleColor = UIColor(hex: 0x9857b3)
}
