//
//  SpeakingViewController.swift
//  CEIOS
//
//  Created by SSd on 11/14/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

class SpeakingViewController: UIViewController {
    
    public var url = URL(fileURLWithPath: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        self.view.backgroundColor = UIColor.red
        let waveFormFrame = CGRect(x: 0, y: view.frame.height*1/3, width: view.frame.width, height: view.frame.height*2/3)
        let controllerWaveForm = ControllerWaveForm(frame: waveFormFrame, mp3Url: url)
        gradientBackground()
        view.addSubview(controllerWaveForm)
        
        //add text header
        //add text content
        let headerArea = view.frame.height*1/3
        let textConsumFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: headerArea/2)
        let sentenceConsume = UITextView(frame: textConsumFrame)
        sentenceConsume.backgroundColor = UIColor.clear
        sentenceConsume.contentOffset = CGPoint(x: 0, y: -20)
        sentenceConsume.textAlignment = .center
        sentenceConsume.textColor = UIColor.red
        sentenceConsume.font = UIFont (name: "HelveticaNeue-UltraLight", size: 16)
        sentenceConsume.text = "Repeated 1000 time"
        view.addSubview(sentenceConsume)

        
        //add text content
        let textFrame = CGRect(x: 0, y: headerArea/2, width: view.frame.width, height: headerArea/2)
        let sentence = UITextView(frame: textFrame)
        sentence.backgroundColor = UIColor.clear
        sentence.textAlignment = .center
        sentence.text = "1. Do you create pickture and story in your mind as you sleap "
        view.addSubview(sentence)
        
    }
    override func viewWillLayoutSubviews() {
        
    }
    func gradientBackground() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = view.bounds
        let startColor =  UIColor(red: 236/255, green: 231/255, blue: 165/255, alpha: 1.0)
        let endColor = UIColor(red: 235/255, green: 83/255, blue: 102/255, alpha: 1.0)
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.locations = [0.0,1.0]
        view.layer.insertSublayer(gradient, at: 0)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
