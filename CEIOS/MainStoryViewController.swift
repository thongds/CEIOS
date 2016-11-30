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
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = hide
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0 , width: view.frame.width, height: view.frame.height))
        textView = UITextView()
        let sortString = "Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology"
        
        string = "Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be"
        textView.text = "\(string) \(string) \(string)"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.frame.size.width = view.frame.width
        textView.backgroundColor = UIColor.clear
        textView.sizeToFit()
        scrollView.backgroundColor = UIColor.white
        scrollView.addSubview(textView)
        view.addSubview(scrollView)
    }
    
    override func viewDidLayoutSubviews() {
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "ArialMT", size: 14)
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
        print(text)
        let longestWord = text
        let longString = string
        let longestWordRange = (longString as NSString).range(of: longestWord)
        
        let attributedString = NSMutableAttributedString(string: longString, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 20)])
        
        attributedString.setAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 20), NSForegroundColorAttributeName : UIColor.red], range: longestWordRange)
        textView.attributedText = attributedString
        
    }
}
