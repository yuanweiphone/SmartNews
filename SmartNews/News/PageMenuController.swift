//
//  PageMenuController.swift
//  SmartNews
//
//  Created by 苑伟 on 2017/6/21.
//  Copyright © 2017年 苑伟. All rights reserved.
//

import UIKit

let kMenuItemWidth   = CGFloat(70)
let kMenuItemHeight  = CGFloat(40)
let kSmartTabMargin  = CGFloat(6)
let kIndicatorHeight = CGFloat(2)

let kMenuItemBaseTag = 200

let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height
let statusBarHeight = UIApplication.shared.statusBarFrame.size.height

class PageMenuController: UIViewController {

    let menuColors = [BaseColor.RedColor,BaseColor.OrangeColor,BaseColor.GreenColor,BaseColor.DarkBlueColor,BaseColor.PurpleColor,BaseColor.RedColor,BaseColor.OrangeColor,BaseColor.LightGrayColor]

    var scrollView: UIScrollView!
    var pageViewController: UIPageViewController!
    
    var titles = [String]()  //标题集合
    var childControllers = [UIViewController]() //viewController集合
    var menuItems = [MenuItem]() //设置标签集合
    
    var menuIndicator: UIView!

    var oldValue: Int!         //记录已选的标签
    var currentIndex: Int? {   //记录当前选中的标签
        didSet {
            let item = self.menuItems[self.oldValue!]
            var frame = item.menuFrame
            frame?.origin.y = CGFloat(kSmartTabMargin)
            frame?.size.height = CGFloat(kMenuItemHeight - kSmartTabMargin)
            item.menuFrame = frame
            
            moveIndicatorAtIndex(index: currentIndex!)
            
            self.oldValue = currentIndex
        }
    }
    
    //MARK: ===================================== 重写初始化方法
    init(controllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        
        self.childControllers = controllers
        self.oldValue = 0
        
        var titles = [NSString]()
        for vc in childControllers {
            let title = vc.value(forKey: "title") as! NSString
            titles.append(title)
        }
        self.titles = titles as [String]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let scrollView = UIScrollView(frame: CGRect(x: 0, y: statusBarHeight, width: kScreenWidth, height: kMenuItemHeight + kIndicatorHeight))
        scrollView.backgroundColor = UIColor.clear
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        self.view.addSubview(scrollView)
        self.scrollView = scrollView
        
        prepareForMenuItems()
        prepareForMenuIndicator()

        let pageViewController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: [:])
        pageViewController.delegate = self
        pageViewController.dataSource = self
        self.pageViewController = pageViewController
        
        let startingViewController = self.childControllers[0]
        let viewControllers = [startingViewController]
        pageViewController.setViewControllers(viewControllers, direction: .forward, animated: false, completion: nil)
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        
        let y = statusBarHeight + scrollView.frame.size.height
        
        pageViewController.view.frame = CGRect(x: 0, y: y, width: kScreenWidth, height: kScreenHeight - y)
        pageViewController.didMove(toParent: self)
    }
    
    func moveIndicatorAtIndex(index: Int) {
    
        willMoveIndicatorAtIndex(index: index)

        let menuColor = menuColorAtIndex(index: index)
        
        let item = menuItems[index]
        var frame = item.menuFrame
        frame?.origin.y = 0
        frame?.size.height = kMenuItemHeight
        item.menuFrame = frame
        menuIndicator.backgroundColor = menuColor
    }

    func willMoveIndicatorAtIndex(index: Int) {
        
        let w = kMenuItemWidth
        var x = w * CGFloat(index)
        let y: CGFloat = 0
        
        let width = scrollView.frame.size.width
        let size = scrollView.contentSize
        let leftX = (width - w) * 0.5
        let tabN = width / w
        let rightX = size.width - (tabN * 0.5 + 0.5) * w
        if (x <  leftX) { x  = 0 }
        else if (x > rightX) { x  = size.width - width }
        else { x -= leftX }
        scrollView.setContentOffset(CGPoint(x:x,y:y), animated: true)
    }
    
    //MARK: ===================================== 设置标签背景
    func menuColorAtIndex(index: Int) -> UIColor {
    
        return self.menuColors[index % menuColors.count]
    }
    
    //MARK: ===================================== 设置顶部切换标签
    func prepareForMenuItems() {
        
        var x: CGFloat = 0.0
        let y = kSmartTabMargin
        let w = kMenuItemWidth
        let h = kMenuItemHeight - y
        
        for i in 0..<titles.count {
            let menuColor = menuColorAtIndex(index: i)
            let label = UILabel(frame: CGRect(x: x, y: y, width: w, height: h))
            label.tag = kMenuItemBaseTag + i
            label.text = titles[i]
            label.textAlignment = .center
            label.isUserInteractionEnabled = true
            label.textColor = UIColor.white
            label.backgroundColor = menuColor
            label.font = UIFont.boldSystemFont(ofSize: 13)
            if i == 0 {
                var frame = label.frame
                frame.origin.y = 0.0
                frame.size.height = kMenuItemHeight
                label.frame = frame
            }
            scrollView.addSubview(label)
            x += w
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap(tap:)))
            label.addGestureRecognizer(tapGesture)
            
            let item = MenuItem.init(label: label)
            menuItems.append(item)
        }
        
        scrollView.contentSize = CGSize(width: x, height: scrollView.bounds.size.height)
        
        let width = scrollView.bounds.size.width
        var frame = scrollView.frame
        if width > x {
            frame.origin.x = floor(width - x) * 0.5
            frame.size.width = x
        } else {
            frame.origin.x = 0.0
            frame.size.width = width
        }
        scrollView.frame = frame
    }
    
    //MARK: ===================================== 顶部切换标签点击事件
    @objc func handleSingleTap(tap: UITapGestureRecognizer) {
    
        let index = (tap.view?.tag)! - kMenuItemBaseTag
        //禁止重复点击
        if currentIndex == index {
            return
        }
        let viewController = childControllers[index]
        let viewControllers = [viewController]
        let direction = (index > oldValue!) ? UIPageViewController.NavigationDirection.forward : UIPageViewController.NavigationDirection.reverse
        currentIndex = index
       
        pageViewController.setViewControllers(viewControllers, direction: direction, animated: true, completion: nil)
    }
    
    //MARK: ===================================== 设置标签底部下线
    func prepareForMenuIndicator() {
        let x: CGFloat = 0.0
        let y = scrollView.frame.size.height - kIndicatorHeight
        let w = self.scrollView.contentSize.width
        let h = kIndicatorHeight

        let menuColor = menuColors[0]

        let menuIndicator = UIView(frame: CGRect(x: x, y: y, width: w, height: h))
        menuIndicator.backgroundColor = menuColor
        scrollView.addSubview(menuIndicator)
        self.menuIndicator = menuIndicator
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: =========================== UIPageViewControllerDelegate,UIPageViewControllerDataSource
extension PageMenuController: UIPageViewControllerDelegate,UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        let viewController = pendingViewControllers.last
        let index = childControllers.firstIndex(of: viewController!)
        if index != self.oldValue {
            willMoveIndicatorAtIndex(index: index!)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        let index = childControllers.firstIndex(of: (pageViewController.viewControllers?.last)!)
        if completed {
            self.currentIndex = index
        } else {
            willMoveIndicatorAtIndex(index: index!)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
        
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone {
            let currentViewController = pageViewController.viewControllers?[0]
            let viewControllers = [currentViewController] as! [UIViewController]
            pageViewController.setViewControllers(viewControllers , direction: .forward, animated: true, completion: nil)
            pageViewController.isDoubleSided = false
            
            return .min
        }
        return .none
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = childControllers.firstIndex(of: viewController)!
        if index == 0 || index == NSNotFound {
            return nil
        }
        index -= 1
        return childControllers[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = childControllers.firstIndex(of: viewController)!
        if  index == NSNotFound {
            return nil
        }
        index += 1
        if index == childControllers.count {
            return nil
        }
        return childControllers[index]
    }
}


class MenuItem: NSObject {
    
    var title: String? {
        didSet {
            self.label.text = title
        }
    }
    
    var titleColor: UIColor? {
        didSet {
            self.label.textColor = titleColor
        }
    }
    var backgroundColor: UIColor? {
        didSet {
            self.label.backgroundColor = backgroundColor
        }
    }
    
    var label: UILabel!
    var menuFrame: CGRect? {
        didSet {
            self.label.frame = menuFrame!
            roundingCornersOfLabel(label: self.label)
        }
    }
    //MARK: 初始化标签
    init(label: UILabel) {
        super.init()
        self.label = label
        titleColor = label.textColor
        backgroundColor = label.backgroundColor
        menuFrame = label.frame
        roundingCornersOfLabel(label: label)
    }
    
    //MARK: 给标签设置圆角
    func roundingCornersOfLabel(label: UILabel) {
        let maskPath = UIBezierPath(roundedRect: label.bounds, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 4, height: 4))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = label.bounds
        maskLayer.path = maskPath.cgPath
        label.layer.mask = maskLayer
    }
}

