//
//  DiscoverViewController.swift
//  SmartNews
//
//  Created by 苑伟 on 2017/6/21.
//  Copyright © 2017年 苑伟. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {

    let discoverCell1 = "discoverCell1"
    let discoverCell2 = "discoverCell2"
    let discoverCell3 = "discoverCell3"
    let headerReusableView = "headerReusableView"
    let footerReusableView = "footerReusableView"

    lazy var hotImageView: UIImageView = {
        let hotImageView = UIImageView(frame: CGRect(x: 5, y: -185, width: kScreenWidth-10, height: 180))
        hotImageView.contentMode = .scaleAspectFill
        hotImageView.clipsToBounds = true
        hotImageView.image = UIImage(named: "001")
        hotImageView.layer.cornerRadius = 3.0
        hotImageView.layer.masksToBounds = true
        return hotImageView
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame:CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = UIColor.white
        collectionView.register(DisCoverCollectionViewCell.self, forCellWithReuseIdentifier: self.discoverCell1)
        collectionView.register(DiscoverItemCollectionCell.self, forCellWithReuseIdentifier: self.discoverCell2)
        collectionView.register(DiscoverCategoriesCollectionCell.self, forCellWithReuseIdentifier: self.discoverCell3)
        collectionView.register(DiscoverHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.headerReusableView)
        collectionView.register(DiscoverFooterReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: self.footerReusableView)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }

        collectionView.contentInset = UIEdgeInsets(top: 195, left: 0, bottom: 10, right: 0)
        collectionView.addSubview(hotImageView)
        
        setupSearchView()
    }
    
    func setupSearchView() {
    
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: kScreenWidth - 20, height: 40))
        searchBar.placeholder = "Search for channels"
        searchBar.returnKeyType = .search
        searchBar.subviews[0].subviews[0].removeFromSuperview()
        searchBar.backgroundColor = BaseColor.BackGroundColor
        searchBar.delegate = self
        
        let searchView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth - 20, height: 40))
        searchView.backgroundColor = UIColor.clear
        searchView.addSubview(searchBar)
        
        self.navigationItem.titleView = searchView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension DiscoverViewController: UISearchBarDelegate {

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension DiscoverViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else if section == 1 {
            return 8
        } else if section == 2 {
            return 12
        }
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.discoverCell1, for: indexPath) as! DisCoverCollectionViewCell
            cell.iconImageView.image = UIImage(named: "002")
            cell.contentLabel.text = "Health.com"
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.discoverCell2, for: indexPath) as! DiscoverItemCollectionCell
            cell.iconImageView.image = UIImage(named: "003")
            cell.contentLabel.text = "Healthline"
            cell.badgeLabel.isHidden = true
            return cell
        } else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.discoverCell2, for: indexPath) as! DiscoverItemCollectionCell
            cell.iconImageView.image = UIImage(named: "004")
            cell.contentLabel.text = "Maxim"
            cell.badgeLabel.isHidden = false
            cell.badgeLabel.text = String(indexPath.item + 1)
            return cell
        }
        let array = ["Essentials","News","EnterTainment","Lifestyle","Health","Sports","Business & Finance","Technology","Science","SmartNews Specials"]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.discoverCell3, for: indexPath) as! DiscoverCategoriesCollectionCell
        cell.titleLabel.text = array[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: (kScreenWidth - 15)/2, height: 90)
        } else if indexPath.section == 3 {
            return CGSize(width:kScreenWidth, height: 44)
        }
        return CGSize(width:(kScreenWidth - 25)/4, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 3 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 2 || section == 3 {
            return CGSize(width: kScreenWidth, height: 44)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 2 {
            return CGSize(width: kScreenWidth, height: 40)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReusableView, for: indexPath) as! DiscoverHeaderReusableView
            if indexPath.section == 2 {
                view.titleLabel.text = "Trending"
            } else if indexPath.section == 3 {
                view.titleLabel.text = "Categories"
            }
            return view
        }
        else if kind == UICollectionView.elementKindSectionFooter {
            if indexPath.section == 2 {
                let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerReusableView, for: indexPath) as! DiscoverFooterReusableView
                return view
            }
        }
        return UICollectionReusableView()
    }

}

