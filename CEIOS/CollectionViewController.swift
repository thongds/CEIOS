//
//  CollectionViewController.swift
//  CEIOS
//
//  Created by SSd on 11/25/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    
    var cellCustomId = "CellCustom"
    var naviHeight  : CGFloat?
    let playControllerHeight : Int = 100
    let space : Int = 10
    let tabBarHeight : Int = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        naviHeight = navigationController?.navigationBar.frame.height
        navigationController?.navigationBar.backItem?.hidesBackButton = true
        navigationController?.navigationBar.backgroundColor = UIColor.clear
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
       setupMainCollectionView()
       //setupPlayController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupPlayController()  {
        
        let playControllerView = UIView()
        playControllerView.backgroundColor = UIColor.green
        playControllerView.translatesAutoresizingMaskIntoConstraints = false
        
        let tabBar = UIView()
        tabBar.backgroundColor = UIColor.clear
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(tabBar)
        view.addSubview(playControllerView)
        let views = ["playControllerView":playControllerView,"tabBar" : tabBar]
        let matrics = ["naviHeight": naviHeight!,"playControllerHeight" : playControllerHeight,"space" : space,"tabBarHeight" : tabBarHeight] as [String : Any]
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[playControllerView]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-naviHeight-[playControllerView(playControllerHeight)]", options: [], metrics: matrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[tabBar]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[playControllerView]-space-[tabBar(tabBarHeight)]", options: [], metrics: matrics, views: views))
        //tabBar.topAnchor.constraint(equalTo: playControllerView.bottomAnchor).isActive = true
        
    }
    
    func setupMainCollectionView(){
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 1
        }
        let spaceContaint = naviHeight! + CGFloat(playControllerHeight+space+tabBarHeight+100)
        print(CGFloat(playControllerHeight+space+tabBarHeight))
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        
        collectionView?.isPagingEnabled = true
        // Register cell classes
        view.backgroundColor = UIColor.white
        self.collectionView!.register(ListeningViewCell.self, forCellWithReuseIdentifier: cellCustomId)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellCustomId, for: indexPath) as! ListeningViewCell
        // Configure the cell
        cell.backgroundColor = UIColor.gray
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height/2)
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
