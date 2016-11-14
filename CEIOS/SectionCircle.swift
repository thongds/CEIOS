//
//  SectionCircle.swift
//  CEIOS
//
//  Created by SSd on 11/11/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

class SectionCircle: UIView {

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    var numberLabel:UILabel?
    var textString : String?
    let lineWidth : CGFloat =  2
    let mFrame : CGRect?
    let fillColor = UIColor(red: 212/255, green: 108/255, blue: 121/255, alpha: 1.0)
    override func draw(_ rect: CGRect) {
        let insetPath = rect.insetBy(dx: lineWidth/2, dy: lineWidth/2)
        let path = UIBezierPath(ovalIn: insetPath)
        path.lineWidth = lineWidth
        fillColor.setFill()
        path.fill()
    }
    
    init(frame: CGRect,textLabel : String) {
        textString = textLabel
        mFrame = frame
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        setup()
    }
    override func awakeFromNib() {
        setup()
    }
    override func prepareForInterfaceBuilder() {
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        numberLabel = UILabel(frame: bounds)
        guard let numberLabel = numberLabel else { return }
        numberLabel.textAlignment = .center
        numberLabel.textColor = UIColor.white
        numberLabel.font = UIFont(name: "HelveticaNeue-Bold", size: (mFrame?.size.width)!/6)
        numberLabel.text = textString
        addSubview(numberLabel)
      
    }


}
