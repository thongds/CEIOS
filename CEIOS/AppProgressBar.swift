//
//  AppProgressBar.swift
//  CEIOS
//
//  Created by SSd on 11/10/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit
protocol  AppProgressBarOnclick {
    func onClick(type : Int)
}
class AppProgressBar: UIView {

    var numberLabel:UILabel?
    var textString : String?
    let lineWidth : CGFloat =  2
    let mFrame : CGRect
    var fillColor = UIColor(red: 219/255, green: 89/255, blue: 105/255, alpha: 1.0)
    let sectionCircleShape = CAShapeLayer()
    let startCircleShape = CAShapeLayer()
    let endCircleShape = CAShapeLayer()
    let currentPositionShape = CAShapeLayer()
    let progressLine = CAShapeLayer()
    let playCircleShape = CAShapeLayer()
    let trianglePlayShape = CAShapeLayer()
    let tickShape = CAShapeLayer()
    let percent : Float
    let callBackParam : AppProgressBarOnclick
    let typeParam : Int
    let utilFunction = UtilFunction()
    override func draw(_ rect: CGRect) {
        addShape()
    }
    
    init(frame: CGRect,textLabel : String,percentParam :Float,type : Int,callBack : AppProgressBarOnclick) {
        textString = textLabel
        mFrame = frame
        percent = percentParam
        callBackParam = callBack
        typeParam = type
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addShape()  {
        //sectionCircle
        sectionCircleShape.frame = CGRect(x: 0, y: 0, width: frame.size.height, height: frame.size.height)
        let space =  mFrame.size.width/100
        let arcCenter = sectionCircleShape.position
        let radius = sectionCircleShape.bounds.size.width / 2.0
        let startAngle = CGFloat(0.0)
        let endAngle = CGFloat(2.0 * M_PI)
        let clockwise = true
        let circlePath = utilFunction.createCirclePath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        if percent < 50 {
            fillColor = UIColor.gray
        }
        sectionCircleShape.fillColor = fillColor.cgColor
        sectionCircleShape.strokeColor = fillColor.cgColor
        sectionCircleShape.path = circlePath.cgPath
        
        let textLayer = CATextLayer()
        textLayer.string = textString
        let textHeigt = CGFloat(20)
        textLayer.frame = CGRect(x: 0, y: arcCenter.y - textHeigt/2, width: sectionCircleShape.frame.width, height: textHeigt)
        //textLayer.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        textLayer.fontSize = sectionCircleShape.frame.width/6
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.alignmentMode = kCAAlignmentCenter
        sectionCircleShape.backgroundColor = UIColor.clear.cgColor
        sectionCircleShape.addSublayer(textLayer)
        if percent > 0 && percent < 100 {
            sectionCircleShape.fillColor = UIColor.clear.cgColor
            sectionCircleShape.strokeColor = fillColor.cgColor
            textLayer.foregroundColor = fillColor.cgColor
        }
        if percent < 50 {
            sectionCircleShape.fillColor = UIColor.clear.cgColor
            sectionCircleShape.strokeColor = fillColor.cgColor
            textLayer.foregroundColor = fillColor.cgColor
        }
        //startCircle
        let startCircleWidth = mFrame.size.height/5
        startCircleShape.frame = CGRect(x: sectionCircleShape.bounds.width + space, y: mFrame.size.height/2-startCircleWidth/2, width: startCircleWidth, height: startCircleWidth)
        let pointCenter = CGPoint(x: startCircleWidth/2.0, y: startCircleWidth/2.0)
        let startCirclePath = utilFunction.createCirclePath(arcCenter: pointCenter, radius: startCircleShape.bounds.size.width/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        startCirclePath.lineWidth = CGFloat(2)
        startCircleShape.fillColor = fillColor.cgColor
        startCircleShape.path = startCirclePath.cgPath
        
        //progressLine
        progressLine.frame = CGRect(x: startCircleShape.frame.origin.x + startCircleShape.frame.size.width, y: mFrame.size.height/2, width: mFrame.size.width*0.45, height: 1)
        progressLine.fillColor = fillColor.cgColor
        progressLine.backgroundColor = fillColor.cgColor
        
        //currentPosition
        let currentPositionShapeHeigh = mFrame.size.height*4/5
        let startX = startCircleShape.frame.origin.x + startCircleShape.frame.size.width/2
        let progressWith = progressLine.frame.width + startCircleShape.frame.size.width
        let currentPositionShapeWith = startCircleWidth*2
        let currentPositionX = progressWith * CGFloat(percent/100) + startX - currentPositionShapeWith/2
        currentPositionShape.frame = CGRect(x: currentPositionX, y: mFrame.size.height/2-currentPositionShapeHeigh/2, width: currentPositionShapeWith, height: currentPositionShapeHeigh)
        let currentCirclePath = utilFunction.createCirclePath(arcCenter: CGPoint(x: currentPositionShapeWith/2.0,y:currentPositionShapeHeigh/2.0), radius: currentPositionShapeWith/4.0, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        currentPositionShape.path = currentCirclePath.cgPath
        currentPositionShape.fillColor = fillColor.cgColor
        
        let percentTextShape = CATextLayer()
        percentTextShape.string = "\(String (Int(percent)))%"
        percentTextShape.foregroundColor = fillColor.cgColor
        percentTextShape.frame = CGRect(x: 0, y: currentPositionShapeHeigh/8, width: currentPositionShapeWith, height: currentPositionShapeHeigh/2)
        percentTextShape.fontSize = 10
        percentTextShape.contentsScale = UIScreen.main.scale
        percentTextShape.alignmentMode = kCAAlignmentCenter
        currentPositionShape.addSublayer(percentTextShape)
        
        //endCircle
        endCircleShape.frame = CGRect(x: progressLine.frame.origin.x+progressLine.frame.size.width, y: mFrame.size.height/2-startCircleWidth/2, width: startCircleWidth, height: startCircleWidth)
        let endCirclePath = utilFunction.createCirclePath(arcCenter: pointCenter, radius: startCircleShape.bounds.size.width/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        endCircleShape.fillColor = fillColor.cgColor
        endCircleShape.path = endCirclePath.cgPath
        
        //playCricle shape
        let playCircleWidth = mFrame.size.height*0.4
        playCircleShape.frame = CGRect(x: endCircleShape.frame.origin.x+endCircleShape.frame.size.width+space, y: mFrame.size.height/2-playCircleWidth/2, width: playCircleWidth, height: playCircleWidth)
        let playCircleCenter = CGPoint(x:playCircleWidth/2,y:playCircleWidth/2)
        let playCirclePath = utilFunction.createCirclePath(arcCenter: playCircleCenter, radius: playCircleShape.bounds.size.width/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        playCircleShape.fillColor = fillColor.cgColor
        playCircleShape.path = playCirclePath.cgPath
        //play triangle
        let triangHeigh = playCircleShape.frame.height/2
        trianglePlayShape.frame = CGRect(x: playCircleShape.frame.origin.x+playCircleShape.frame.width/3, y: mFrame.size.height/2-triangHeigh/2, width: triangHeigh, height: triangHeigh)
        let closePath = UIBezierPath()
        var startPointToDraw = CGPoint(x: 0, y: 0)
        closePath.move(to: startPointToDraw)
        startPointToDraw.y = trianglePlayShape.frame.width
        closePath.addLine(to: startPointToDraw)
        startPointToDraw.x = trianglePlayShape.frame.width
        startPointToDraw.y = trianglePlayShape.frame.height/2
        closePath.addLine(to: startPointToDraw)
        closePath.addLine(to: CGPoint(x: 0, y: 0))
        trianglePlayShape.fillColor = UIColor.white.cgColor
        trianglePlayShape.strokeColor = UIColor.white.cgColor
        trianglePlayShape.path = closePath.cgPath
        trianglePlayShape.backgroundColor = UIColor.clear.cgColor
        // add tick complete 
        if percent == 100 {
            let tickCircleDiameter = mFrame.size.height/5
            let tickCircleRadius = tickCircleDiameter/2
            let y = sin(45)*radius
            let x = y*(cos(45)/sin(45))
            let yCircle = radius-y
            let xCircle = radius+x
//            let yShape = yCircle - tickCircleRadius
//            let xShape = xCircle - tickCircleRadius
            tickShape.frame = CGRect(x: xCircle, y: yCircle, width: tickCircleDiameter, height: tickCircleDiameter)
            let tickCircleCenter = CGPoint(x: tickCircleRadius, y: tickCircleRadius)
            let tickCirclePath = utilFunction.createCirclePath(arcCenter: tickCircleCenter, radius: tickCircleRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            tickShape.fillColor = UIColor.green.cgColor
            tickShape.path = tickCirclePath.cgPath
            tickShape.backgroundColor = UIColor.clear.cgColor
            
            let tickLineShape = CAShapeLayer()
            tickLineShape.frame = CGRect(x: 0, y: 0, width: tickCircleDiameter, height: tickCircleDiameter)
            tickLineShape.backgroundColor = UIColor.clear.cgColor
            let tickLine = UIBezierPath()
            var tickLineStartPoint = CGPoint(x: tickCircleRadius/2, y:tickCircleRadius/2)
            tickLine.move(to: tickLineStartPoint)
            tickLineStartPoint.x = tickCircleRadius
            tickLineStartPoint.y = tickCircleRadius * 3/2
            tickLine.addLine(to: tickLineStartPoint)
            let yTickCircle = sin(45)*tickCircleRadius
            let xTickCircle = yTickCircle*(cos(45)/sin(45))
            let yRealTickCircle = tickCircleRadius-yTickCircle
            let xRealTickCircle = tickCircleRadius+xTickCircle
            tickLineStartPoint.y = yRealTickCircle
            tickLineStartPoint.x = xRealTickCircle
            tickLine.addLine(to: tickLineStartPoint)
            tickLine.lineWidth = CGFloat(4)
            tickLineShape.fillColor = UIColor.clear.cgColor
            tickLineShape.strokeColor = UIColor.white.cgColor
            tickLineShape.path = tickLine.cgPath
            tickShape.addSublayer(tickLineShape)
        }
        //addSubLayer
        layer.addSublayer(sectionCircleShape)
        layer.addSublayer(startCircleShape)
        layer.addSublayer(progressLine)
        layer.addSublayer(endCircleShape)
        layer.addSublayer(playCircleShape)
        layer.addSublayer(trianglePlayShape)
        layer.addSublayer(currentPositionShape)
        if percent == 100 {
            layer.addSublayer(tickShape)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            callBackParam.onClick(type: typeParam)
        }
    }
}
