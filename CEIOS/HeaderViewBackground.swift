//
//  HeaderViewBackground.swift
//  CEIOS
//
//  Created by SSd on 11/10/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

class HeaderViewBackground: UIView {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        let startColor =  UIColor(red: 201/255, green: 65/255, blue: 0/255, alpha: 1.0)
        let endColor = UIColor(red: 159/255, green: 4/255, blue: 27/255, alpha: 1.0)
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.locations = [0.0,1.0]
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawGradient(_ startColor:UIColor, endColor: UIColor, startPoint:CGPoint, endPoint:CGPoint) {
        
        let colors = [startColor.cgColor, endColor.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations:[CGFloat] = [0.0, 1.0]
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: colorLocations)
        let context = UIGraphicsGetCurrentContext()
        
        context?.drawLinearGradient(gradient!,
                                    start: startPoint,
                                    end: endPoint,
                                    options: [])
        
    }
}
