//
//  ScrollViewTabViewController.swift
//  CEIOS
//
//  Created by SSd on 11/29/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class ScrollViewTabViewController: UIViewController ,UIScrollViewDelegate {

    var scrollView : UIScrollView?
    let hide = false
    var lefHeaderTab = UILabel()
    var rightHeaderTab = UILabel()
    var  playButton = PlayButtonView()
    let mainStoryViewController = MainStoryViewController()
    let moviePlayer = AVPlayerViewController()
    let questionViewController = QuestionCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
    override func viewDidLoad() {
        super.viewDidLoad()
        showSubtitle()
        addView()
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
    func addView() {
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
        playButton = PlayButtonView(frame: CGRect(x: playView.frame.width/2 - playButtonHeight/2, y: playView.frame.height/2-playButtonHeight/2, width: playButtonHeight, height: playButtonHeight))
        playButton.addTarget(self, action: #selector(self.clickPlay) , for: .touchUpInside)
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
        mainStoryViewController.view.backgroundColor = UIColor.red
        mainStoryViewController.view.frame = CGRect(x: 0, y: 0, width: (scrollView?.frame.width)!, height: scrollViewHeight)
        mainStoryViewController.viewParentSplit = viewContaint.frame.height - scrollViewHeight
        
        questionViewController.view.backgroundColor = UIColor.blue
        questionViewController.view.frame = CGRect(x:scrollView!.frame.width , y:0 , width: (scrollView?.frame.width)!, height: scrollViewHeight)
        addViewController(viewController: mainStoryViewController)
        addViewController(viewController: questionViewController)
        // set scrollView contentsize
        scrollView?.contentSize = CGSize(width: view.frame.width*2, height: 1.0)
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
    func showSubtitle() {
        let videoFile = Bundle.main.path(forResource: "one_night_only", ofType: "mp3")
        
        // Subtitle file
        let subtitleFile = Bundle.main.path(forResource: "one_night_only", ofType: "srt")
        let subtitleURL = URL(fileURLWithPath: subtitleFile!)
        
        // Movie player
       
        moviePlayer.player = AVPlayer(url: URL(fileURLWithPath: videoFile!))
        
        // present(moviePlayer, animated: true, completion: nil)
        
        // Add subtitles
        //moviePlayer.addSubtitles().open(file: subtitleURL)
        moviePlayer.setCallback(callback: mainStoryViewController.getSubCallback())
        moviePlayer.addSubtitles().open(file: subtitleURL, encoding: String.Encoding.utf8)
        
        // Change text properties
        moviePlayer.subtitleLabel?.textColor = UIColor.white
        
        // Play
        //moviePlayer.player?.play()
        
    }
    
    func clickPlay(){
        if moviePlayer.player?.rate != 0 && moviePlayer.player?.error == nil {
            moviePlayer.player?.pause()
            playButton.setPlayStatus(isPlay: false)
        }else{
            moviePlayer.player?.play()
            playButton.setPlayStatus(isPlay: true)
        }
    }

}

