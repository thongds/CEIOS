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
    var text = UITextView()
    let hide = true
    var scrollView = UIScrollView()
    public var viewParentSplit : CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = hide
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0 , width: view.frame.width, height: view.frame.height))
        text = UITextView()
        let sortString = "Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology"
        
        string = "Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be Much research has focused on how fire gave an evolutionary advantage to early humans. Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not   a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be,which might explain why coffee drinkers may be"
        text.text = "\(string) \(string) \(string)"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        text.frame.size.width = view.frame.width
        text.backgroundColor = UIColor.clear
        text.sizeToFit()
        print(text.bounds.size)
        print(text.frame.size)
//        text.layoutIfNeeded()
//        let height = text.sizeThatFits(CGSize(width: text.frame.size.width, height: CGFloat.greatestFiniteMagnitude)).height
//        text.contentSize.height = height
        scrollView.backgroundColor = UIColor.white
        scrollView.addSubview(text)
        view.addSubview(scrollView)
    }
    
    override func viewDidLayoutSubviews() {
        text.isScrollEnabled = false
        text.font = UIFont(name: "ArialMT", size: 14)
        scrollView.contentSize = CGSize(width: text.frame.size.width, height: text.bounds.size.height+viewParentSplit)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
        return hide
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
