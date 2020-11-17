//
//  MainTabVC.swift
//  SmartNews
//
//  Created by 苑伟 on 2017/6/21.
//  Copyright © 2017年 苑伟. All rights reserved.
//

import UIKit


class MainTabVC: UITabBarController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 统一定义菜单按钮
        let tabbatItem = UITabBarItem.appearance()
        let attr = [NSAttributedString.Key.foregroundColor:BaseColor.GrayColor]
        let selectedAttr = [NSAttributedString.Key.foregroundColor:BaseColor.DarkBlueColor]
        tabbatItem.setTitleTextAttributes(attr, for: .normal)
        tabbatItem.setTitleTextAttributes(selectedAttr, for: .selected)

        add(childViewController: NewsViewController(), title: "News",imageName: "new")
        add(childViewController: DiscoverViewController(), title: "Discover",imageName: "discover")
        add(childViewController: SettingViewController(), title: "Setting",imageName: "setting")
    }
    
    func add(childViewController: UIViewController, title: String, imageName: String) {
        
        childViewController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childViewController.tabBarItem.selectedImage = UIImage(named: imageName + "_s")?.withRenderingMode(.alwaysOriginal)
        childViewController.title = title
        let nav = UINavigationController(rootViewController: childViewController)
        addChild(nav)
    }

}




