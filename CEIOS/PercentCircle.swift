//
//  PercentCircle.swift
//  CEIOS
//
//  Created by SSd on 11/11/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

class PercentCircle: UIView {

    
    var fillColor: UIColor?
    
    init(frame: CGRect,fillColorParam : UIColor) {
        super.init(frame: frame)
        fillColor = fillColorParam
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let inSetPath  = rect.insetBy(dx: 1, dy: 1)
        let path = UIBezierPath(ovalIn: inSetPath)
        fillColor?.setFill()
        path.fill()
    }
}
