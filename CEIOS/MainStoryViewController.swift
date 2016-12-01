//
//  MainStoryViewController.swift
//  CEIOS
//
//  Created by SSd on 11/29/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

class MainStoryViewController: UIViewController {

    var string = ""
    var textView = UITextView()
    let hide = true
    var scrollView = UIScrollView()
    public var viewParentSplit : CGFloat = 0
    var  lyric = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = hide
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0 , width: view.frame.width, height: view.frame.height))
        textView = UITextView()
        let sortString = "Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology"
        
        string = "Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not"
        
        lyric = "You want all my love and my devotion You want my loving soul right on the line I have no doubt that I could love you forever The only trouble is you really don't have the time You've got one night only, one night only, that's all you have to spare One night only, let's not pretend to care One night only, one night only, come on big baby come on One night only, we only have til dawn In the morning this feeling will be gone It has no chance going on Something so right has got no chance to live So let's forget about chances, its one night I will give One night only, one night only,you'll be the only one One night only then you have to run one night only, one night only. there's nothing more to say one night only, what's getting in the way one night only, one night only,one night only"
        
        textView.text = "\(lyric)"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.frame.size.width = view.frame.width
        textView.backgroundColor = UIColor.clear
        
        scrollView.backgroundColor = UIColor.white
        scrollView.addSubview(textView)
        view.addSubview(scrollView)
    }
    
    override func viewDidLayoutSubviews() {
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isEditable = false
        textView.sizeToFit()
        //textView.font = UIFont(name: "ArialMT", size: 14)
        scrollView.contentSize = CGSize(width: textView.frame.size.width, height: textView.bounds.size.height+viewParentSplit)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
        return hide
    }
    
    public func getSubCallback() -> SubCallback {
        return self
    }

}
extension MainStoryViewController : SubCallback {
    func subByTimeReturn(text : String){
        //print(text)
        let longestWord = text
        let longString = lyric
        let longestWordRange = (longString as NSString).range(of: longestWord)
        
        let attributedString = NSMutableAttributedString(string: longString, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 16)])
        
        attributedString.setAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 16), NSForegroundColorAttributeName : UIColor.red], range: longestWordRange)
        textView.attributedText = attributedString
        textView.sizeToFit()
    }
}
