//
//  OtherViewController.swift
//  SmartNews
//
//  Created by 苑伟 on 2017/6/21.
//  Copyright © 2017年 苑伟. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {    
    
    let otherFirstCell = "otherFirstCell"
    let otherSecondCell = "otherSecondCell"
    let otherThirdCell = "otherThirdCell"

    var listArray = [TopViewDataModel]()

    lazy var collectionView: UICollectionView = {
    
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0

        let collectionView = UICollectionView(frame:CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = BaseColor.BackGroundColor
        collectionView.register(OtherFirstCollectionViewCell.self, forCellWithReuseIdentifier: self.otherFirstCell)
        collectionView.register(OtherSecondCollectionViewCell.self, forCellWithReuseIdentifier: self.otherSecondCell)
        collectionView.register(OtherThirdCollectionViewCell.self, forCellWithReuseIdentifier: self.otherThirdCell)

        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension OtherViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item % 6 == 5 {
            //一个item
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.otherThirdCell, for: indexPath) as! OtherThirdCollectionViewCell
            cell.model = listArray[indexPath.item]
            return cell

        } else if indexPath.item % 6 == 3 || indexPath.item % 6 == 4 {
            //两个item
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.otherSecondCell, for: indexPath) as! OtherSecondCollectionViewCell
            cell.model = listArray[indexPath.item]
            return cell
        }
        //三个item
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.otherFirstCell, for: indexPath) as! OtherFirstCollectionViewCell
        cell.model = listArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item % 6 == 5 {
            //一个item
            return CGSize(width: kScreenWidth, height: 100)

        } else if indexPath.item % 6 == 3 || indexPath.item % 6 == 4 {
            //两个item
            return CGSize(width: kScreenWidth/2, height: 180)
        }
        //三个item
        return CGSize(width: kScreenWidth/3, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
