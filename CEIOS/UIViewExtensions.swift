//
//  UIViewExtensions.swift
//  CEIOS
//
//  Created by SSd on 11/10/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

extension UIView {
    
    func drawGradient(_ startColor:UIColor, endColor: UIColor, startPoint:CGPoint, endPoint:CGPoint) {
        
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
