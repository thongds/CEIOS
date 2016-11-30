//
//  CollectionViewCell.swift
//  CEIOS
//
//  Created by SSd on 11/25/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        initView()
    }
    
    func initView() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ListeningViewCell : BaseCollectionViewCell {
    let titleLabel: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "systemFontOfSize", size: 50)
        label.text = "Much research has focused on how fire gave an evolutionary advantage to early humans . Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them. In other words how did the harmful effects of fire shape our evolution? professors of biological suggested that cooking led to advantageous changes in human biology They believe that negative consequences of fire might have shaped human evolution and development. Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke"
        
        return label
    }()
    
    override func  initView(){
        let view  = UIView()
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.gray
        view.backgroundColor = UIColor.brown
        view.translatesAutoresizingMaskIntoConstraints = false
        //addSubview(titleLabel)
        
        let views = ["view" : view,"titleLabel": titleLabel,"scrollView": scrollView]
        titleLabel.isEditable = false
        //titleLabel.sizeToFit()
        titleLabel.backgroundColor = UIColor.clear
        //view.addSubview(titleLabel)
        //view.addSubview(scrollView)
       // scrollView.addSubview(titleLabel)
        //scrollView.contentSize = CGSize(width: view.bounds.width, height: titleLabel.frame.height)
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[titleLabel(120)]|", options: [], metrics: nil, views: views))
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[titleLabel(100)]|", options: [], metrics: nil, views: views))
        
 //        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: [], metrics: nil, views: views))
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|", options: [], metrics: nil, views: views))
        
        
    }
    
}
