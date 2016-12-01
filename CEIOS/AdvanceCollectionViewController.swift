//
//  AdvanceCollectionViewController.swift
//  CEIOS
//
//  Created by SSd on 12/1/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell_AdvanceCollectionViewController"

class AdvanceCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        setupMainCollectionView()
        // Register cell classes
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        // Configure the cell
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    func setupMainCollectionView(){
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 1
        }
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        
        collectionView?.isPagingEnabled = false
        // Register cell classes
        view.backgroundColor = UIColor.white
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height/3)
    }
    override func viewDidLayoutSubviews() {
        // collectionView?.contentSize = CGSize(width: view.frame.width, height:  view.frame.height/3 * 100 )
    }

}
