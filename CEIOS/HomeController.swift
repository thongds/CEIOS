//
//  ViewController.swift
//  youtube
//
//  Created by Brian Voong on 6/1/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
   // var videos: [Video]?
    
    let cellId = "cellId"
    
//    func fetchVideos() {
//        ApiService.sharedInstance.fetchVideos { (videos: [Video]) in
//            
//            self.videos = videos
//            self.collectionView?.reloadData()
//            
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetchVideos()
//        
//        navigationController?.navigationBar.isTranslucent = false
//        
//        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
//        titleLabel.text = "  Home"
//        titleLabel.textColor = UIColor.white
//        titleLabel.font = UIFont.systemFont(ofSize: 20)
//        navigationItem.titleView = titleLabel
        
        setupCollectionView()
//        setupMenuBar()
//        setupNavBarButtons()
    }
    
    func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 1
            let width = (collectionView?.frame.width)!/3
            flowLayout.itemSize = CGSize(width: width, height: width)
        }
        
        collectionView?.backgroundColor = UIColor.white
        
//        collectionView?.registerClass(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(ListeningViewCell.self, forCellWithReuseIdentifier: cellId)
        
//        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
//        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        
        //collectionView?.isPagingEnabled = true
    }
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
    }
    
//    lazy var settingsLauncher: SettingsLauncher = {
//        let launcher = SettingsLauncher()
//        launcher.homeController = self
//        return launcher
//    }()
    
    func handleMore() {
        //show menu
        //settingsLauncher.showSettings()
    }
    
//    func showControllerForSetting(_ setting: Setting) {
//        let dummySettingsViewController = UIViewController()
//        dummySettingsViewController.view.backgroundColor = UIColor.white
//        dummySettingsViewController.navigationItem.title = setting.name.rawValue
//        navigationController?.navigationBar.tintColor = UIColor.white
//        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
//        navigationController?.pushViewController(dummySettingsViewController, animated: true)
//    }
    
    func handleSearch() {
       // scrollToMenuIndex(2)
    }
    
//    func scrollToMenuIndex(_ menuIndex: Int) {
//        let indexPath = IndexPath(item: menuIndex, section: 0)
//        collectionView?.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition(), animated: true)
//    }
    
//    lazy var menuBar: MenuBar = {
//        let mb = MenuBar()
//        mb.homeController = self
//        return mb
//    }()
    
//    fileprivate func setupMenuBar() {
//        navigationController?.hidesBarsOnSwipe = true
//        
//        let redView = UIView()
//        redView.backgroundColor = UIColor.rgb(230, green: 32, blue: 31)
//        view.addSubview(redView)
//        view.addConstraintsWithFormat("H:|[v0]|", views: redView)
//        view.addConstraintsWithFormat("V:[v0(50)]", views: redView)
//        
//        view.addSubview(menuBar)
//        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
//        view.addConstraintsWithFormat("V:[v0(50)]", views: menuBar)
//        
//        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
//    }
//    
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
//    }
//    
//    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        
//        let index = targetContentOffset.pointee.x / view.frame.width
//        
//        let indexPath = IndexPath(item: Int(index), section: 0)
//        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition())
//        
//    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = ListeningViewCell()
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ListeningViewCell
        //cell.label.text = "\(indexPath.row)"
        //let colors: [UIColor] = [.blue, .green, UIColor.gray, .purple]
        cell.backgroundColor = UIColor.blue
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width/3, height: view.frame.height/3)
//    }
    
//    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return videos?.count ?? 0
//    }
//    
//    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath) as! VideoCell
//        
//        cell.video = videos?[indexPath.item]
//        
//        return cell
//    }
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let height = (view.frame.width - 16 - 16) * 9 / 16
//        return CGSizeMake(view.frame.width, height + 16 + 88)
//    }
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
//        return 0
//    }
    
}






