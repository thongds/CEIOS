//
//  ScrollViewTabViewController.swift
//  CEIOS
//
//  Created by SSd on 11/29/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

class ScrollViewTabViewController: UIViewController ,UIScrollViewDelegate {

    var scrollView : UIScrollView?
    let hide = false
    var lefHeaderTab = UILabel()
    var rightHeaderTab = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = hide
        //view.translatesAutoresizingMaskIntoConstraints = false
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let nvHeight = (navigationController?.navigationBar.frame.height)! + statusBarHeight
        let viewContaint = UIView(frame: CGRect(x: 0, y: nvHeight, width: view.frame.size.width, height: view.frame.size.height))
        viewContaint.backgroundColor = UIColor.red
        //view.addSubview(viewContaint)
        view.backgroundColor = UIColor.white
        // add PlayView
        let playViewHeight = CGFloat(100)
        let playView = HeaderViewBackground(frame: CGRect(x: 0, y: nvHeight, width: viewContaint.frame.width, height: playViewHeight))
        
        let playButtonHeight = playViewHeight/2
        let playButton = PlayButtonView(frame: CGRect(x: playView.frame.width/2 - playButtonHeight/2, y: playView.frame.height/2-playButtonHeight/2, width: playButtonHeight, height: playButtonHeight))
        playView.addSubview(playButton)
        view.addSubview(playView)
        
        //add tabar
        let tabarHeaderHeight = CGFloat(50)
        let tabarHeader = UIView(frame: CGRect(x: 0, y: playView.frame.origin.y + playViewHeight, width: view.frame.width, height: tabarHeaderHeight))
        tabarHeader.backgroundColor = UIColor.blue
        lefHeaderTab = UILabel(frame: CGRect(x: 0, y: 0, width: tabarHeader.frame.width/2, height: tabarHeader.frame.height))
        lefHeaderTab.text = "Main Story"
        lefHeaderTab.textAlignment = .center
        lefHeaderTab.backgroundColor = UIColor.white
        tabarHeader.addSubview(lefHeaderTab)
        rightHeaderTab = UILabel(frame: CGRect(x: lefHeaderTab.frame.width, y: 0, width: tabarHeader.frame.width/2, height: tabarHeader.frame.height))
        rightHeaderTab.text = "Question"
        rightHeaderTab.textAlignment = .center
        rightHeaderTab.backgroundColor = UIColor.gray
        tabarHeader.addSubview(rightHeaderTab)
        view.addSubview(tabarHeader)
//
        let scrollViewHeight = view.frame.height-tabarHeader.frame.origin.y - tabarHeaderHeight 
        scrollView = UIScrollView(frame: CGRect(x: 0, y: tabarHeader.frame.origin.y + tabarHeaderHeight, width: view.frame.width, height: scrollViewHeight))
        scrollView?.backgroundColor = UIColor.gray
        scrollView?.isPagingEnabled = true
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.translatesAutoresizingMaskIntoConstraints = false
        scrollView?.delegate = self
        view.addSubview(scrollView!)
        let mainStoryViewController = MainStoryViewController()
        mainStoryViewController.view.backgroundColor = UIColor.red
        mainStoryViewController.view.frame = CGRect(x: 0, y: 0, width: (scrollView?.frame.width)!, height: scrollViewHeight)
        mainStoryViewController.viewParentSplit = viewContaint.frame.height - scrollViewHeight
        let layout = UICollectionViewFlowLayout()
        let questionViewController = QuestionCollectionViewController(collectionViewLayout: layout)
        questionViewController.view.backgroundColor = UIColor.blue
        questionViewController.view.frame = CGRect(x:scrollView!.frame.width , y:0 , width: (scrollView?.frame.width)!, height: scrollViewHeight)
        addViewController(viewController: mainStoryViewController)
        addViewController(viewController: questionViewController)
        // set scrollView contentsize 
        scrollView?.contentSize = CGSize(width: view.frame.width*2, height: 1.0)
       
       
//
//        let views = ["scrollView": scrollView , "view" : view, "questionVC" : questionViewController.view, "mainStoryVC" : mainStoryViewController.view]
//        let metrics = ["scrollHeight" : view.frame.height/2]
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView(==view)]|", options: [], metrics: metrics, views: views))
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView(==view)]|", options: [], metrics: nil, views: views))
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[mainStoryVC(==scrollView)]|", options: [], metrics: nil, views: views))
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[mainStoryVC(==scrollView)][questionVC(==scrollView)]|", options: [.alignAllTop,.alignAllBottom], metrics: nil, views: views))
      
     
    }
    override var prefersStatusBarHidden: Bool {
        return hide
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        if let uwScrollView = scrollView {
            uwScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    func addViewController(viewController : UIViewController) {
            viewController.view.translatesAutoresizingMaskIntoConstraints = false
            scrollView!.addSubview(viewController.view)
            addChildViewController(viewController)
            viewController.didMove(toParentViewController: self)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating \(scrollView.contentOffset.x)")
        if scrollView.contentOffset.x >= scrollView.frame.width {
            rightHeaderTab.backgroundColor = UIColor.white
            lefHeaderTab.backgroundColor = UIColor.gray
            
        }else{
            lefHeaderTab.backgroundColor = UIColor.white
            rightHeaderTab.backgroundColor = UIColor.gray
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating \(scrollView.contentOffset.x)")
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
