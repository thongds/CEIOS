//
//  ScrollViewTabViewController.swift
//  CEIOS
//
//  Created by SSd on 11/29/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

class ScrollViewTabViewController: UIViewController {

    var scrollView : UIScrollView?
    let hide = true
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = hide
        //view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        let scrollViewHeight = view.frame.height*2/3
        scrollView = UIScrollView(frame: CGRect(x: 0, y: view.frame.height-scrollViewHeight, width: view.frame.width, height: scrollViewHeight))
        scrollView?.backgroundColor = UIColor.gray
        scrollView?.isPagingEnabled = true
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView!)
        let mainStoryViewController = MainStoryViewController()
        mainStoryViewController.view.backgroundColor = UIColor.red
        mainStoryViewController.view.frame = CGRect(x: 0, y: 0, width: (scrollView?.frame.width)!, height: scrollViewHeight)
        mainStoryViewController.viewParentSplit = view.frame.height - scrollViewHeight
        let layout = UICollectionViewFlowLayout()
        let questionViewController = QuestionCollectionViewController(collectionViewLayout: layout)
        questionViewController.view.backgroundColor = UIColor.blue
        questionViewController.view.frame = CGRect(x:scrollView!.frame.width , y:0 , width: (scrollView?.frame.width)!, height: scrollViewHeight)
        addViewController(viewController: mainStoryViewController)
        addViewController(viewController: questionViewController)
//
//        let views = ["scrollView": scrollView , "view" : view, "questionVC" : questionViewController.view, "mainStoryVC" : mainStoryViewController.view]
//        let metrics = ["scrollHeight" : view.frame.height/2]
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView(==view)]|", options: [], metrics: metrics, views: views))
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView(==view)]|", options: [], metrics: nil, views: views))
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[mainStoryVC(==scrollView)]|", options: [], metrics: nil, views: views))
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[mainStoryVC(==scrollView)][questionVC(==scrollView)]|", options: [.alignAllTop,.alignAllBottom], metrics: nil, views: views))
      scrollView?.contentSize = CGSize(width: view.frame.width*2, height: 1.0)
     
    }
    override var prefersStatusBarHidden: Bool {
        return hide
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
         scrollView!.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func addViewController(viewController : UIViewController) {
            viewController.view.translatesAutoresizingMaskIntoConstraints = false
            scrollView!.addSubview(viewController.view)
            addChildViewController(viewController)
            viewController.didMove(toParentViewController: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
