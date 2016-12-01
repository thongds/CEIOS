//
//  MainViewController.swift
//  CEIOS
//
//  Created by SSd on 12/1/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var viewHeader = UIView()
    var tabarView = UIView()
    var scrollView = UIScrollView()
    var navigationHeight : CGFloat = 0
    let tabarHeight : CGFloat = 80
    let spaceTabarNavigation : CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationControllerView()
        addView()
    }
    func navigationControllerView(){
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = UIColor.clear
        navigationController?.navigationBar.isTranslucent = true
        
        self.navigationItem.title = "Natural Topic"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSForegroundColorAttributeName : UIColor.white]
        let backButton = UIBarButtonItem(image: UIImage(named : "menu"), style: .plain, target: self, action: #selector(ViewController.backAction))
        backButton.tintColor = UIColor.white
        
        self.navigationItem.leftBarButtonItem = backButton
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        navigationHeight = (self.navigationController?.navigationBar.frame.height)!+statusBarHeight
        viewHeader  = HeaderViewBackground(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: navigationHeight))
        viewHeader.translatesAutoresizingMaskIntoConstraints = false
        viewHeader.bounds = viewHeader.frame
        view.backgroundColor = UIColor.white
        view.addSubview(viewHeader)
    }
    
    func addView() {
        addTabar()
        addScrollView()
    }
    
    func addTabar() {
        tabarView.frame = CGRect(x: 0, y: viewHeader.frame.origin.y + tabarHeight, width: view.frame.width, height: tabarHeight)
        tabarView.backgroundColor = UIColor.yellow
        view.addSubview(tabarView)
    }
    
    func addScrollView () {
        let scrollViewHeight = view.frame.height - (navigationHeight + tabarHeight + spaceTabarNavigation)
        scrollView.frame = CGRect(x: 0, y: tabarView.frame.origin.y + tabarHeight, width: view.frame.width , height: scrollViewHeight)
        scrollView.backgroundColor = UIColor.gray
        scrollView.isPagingEnabled = true
        // add subView
        let beginingViewController = BeginingCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        beginingViewController.view.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
        beginingViewController.view.backgroundColor = UIColor.blue
        let intermediateViewController = IntermediateCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        intermediateViewController.view.backgroundColor = UIColor.green
        intermediateViewController.view.frame = CGRect(x: scrollView.frame.width , y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
        let advanceViewController = AdvanceCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        advanceViewController.view.backgroundColor = UIColor.brown
        advanceViewController.view.frame = CGRect(x: scrollView.frame.width*2 , y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
        addViewController(viewController: beginingViewController)
        addViewController(viewController: intermediateViewController)
        addViewController(viewController: advanceViewController)
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.width * 3 , height: 1.0)
        
    }
    override func viewDidLayoutSubviews() {
       scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func addViewController(viewController : UIViewController) {
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        addChildViewController(viewController)
        viewController.didMove(toParentViewController: self)
        scrollView.addSubview(viewController.view)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
