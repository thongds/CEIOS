//
//  UtilFunction.swift
//  CEIOS
//
//  Created by SSd on 11/12/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

class UtilFunction: NSObject {
    
    public func createCirclePath(arcCenter: CGPoint,
                          radius: CGFloat,
                          startAngle: CGFloat,
                          endAngle: CGFloat,
                          clockwise: Bool) -> UIBezierPath {
        
        return UIBezierPath(arcCenter: arcCenter,
                                      radius: radius,
                                      startAngle: startAngle,
                                      endAngle: endAngle,
                                      clockwise: clockwise)
    }
    
}
