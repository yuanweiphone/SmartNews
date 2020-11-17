//
//  NewsViewController.swift
//  SmartNews
//
//  Created by 苑伟 on 2017/6/21.
//  Copyright © 2017年 苑伟. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    var controllers = [UIViewController]()
    let viewTitle = ["Top","Entertain","World","Bize","Tech","Science","Social","Edit"]

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<viewTitle.count {
            if i == 0 {
                let vc = TopViewController(style: .grouped)
                vc.title = viewTitle[0]
                controllers.append(vc)
            } else {
                let vc = OtherViewController()
                vc.title = viewTitle[i]
                controllers.append(vc)
            }
        }
        
        let pageMenuController = PageMenuController(controllers: controllers)
        addChild(pageMenuController)
        view.addSubview(pageMenuController.view)
        pageMenuController.didMove(toParent: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
