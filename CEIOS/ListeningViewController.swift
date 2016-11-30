//
//  ListeningViewController.swift
//  CEIOS
//
//  Created by SSd on 11/22/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit
class ListeningViewController: UIViewController {
    
    var label = UILabel()
    var longString : String = ""
    var attributedString : NSMutableAttributedString?
    override func viewDidLoad() {
        super.viewDidLoad()
        hightLineSub()
        addView()
        showSubtitle()
    }
    
    func hightLineSub() {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        label.numberOfLines = 0 
        longString = "Much research has focused on how fire gave an evolutionary advantage to early humans.Less examined are the negative byproducts that came with fire, and the ways in which humans may or may not have adapted to them. In other words, how did the harmful effects of fire shape our evolution?professors of biological suggested that cooking led to advantageous changes in human biology. They believe that negative consequences of fire might have shaped human evolution and development.Scientists identified a genetic mutation in modern humans that allows certain toxins, including those found in smoke. The mutation may have been one way that modern humans against some adverse effects from fire, while other species were not.  a chemistry professor  showed that the brown molecules that come from roasting coffee can inhibit enzymes produced by tumor cells, which might explain why coffee drinkers may be"
        label.text = longString
        
       // view.addSubview(label)
        
        
    
    }
    
    func addView() {
        view.backgroundColor = UIColor.white
        let navigationHeight = (navigationController?.navigationBar.frame.size.height)!
        let playerView = HeaderViewBackground(frame: CGRect(x: 0, y: navigationHeight+10, width: view.frame.size.width, height: view.frame.size.height/6))
        playerView.backgroundColor = UIColor.red
        playerView.translatesAutoresizingMaskIntoConstraints = false

        let playButtonWidth = playerView.frame.size.height/2
        let playButton = PlayButtonView(frame: CGRect(x: playerView.frame.size.width/2-playButtonWidth/2, y: playerView.frame.size.height-playButtonWidth-10, width: playButtonWidth, height: playButtonWidth))
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playerView.addSubview(playButton)

        //view.addSubview(playerView)
        let collectionView = CollectionViewController()
        addChildViewController(collectionView)
        collectionView.didMove(toParentViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showSubtitle() {
        let videoFile = Bundle.main.path(forResource: "02", ofType: "mp3")
        
        // Subtitle file
        let subtitleFile = Bundle.main.path(forResource: "trailer_720p", ofType: "srt")
        let subtitleURL = URL(fileURLWithPath: subtitleFile!)
        
        // Movie player
        let moviePlayer = AVPlayerViewController()
        moviePlayer.player = AVPlayer(url: URL(fileURLWithPath: videoFile!))
       
       // present(moviePlayer, animated: true, completion: nil)
        
        // Add subtitles
        moviePlayer.addSubtitles().open(file: subtitleURL)
        moviePlayer.setCallback(callback: self)
        moviePlayer.addSubtitles().open(file: subtitleURL, encoding: String.Encoding.utf8)
        
        // Change text properties
        moviePlayer.subtitleLabel?.textColor = UIColor.white
        
        // Play
       // moviePlayer.player?.play()

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
extension ListeningViewController : SubCallback {
    func subByTimeReturn(text : String){
        print(text)
        let longestWord = text
        
        let longestWordRange = (longString as NSString).range(of: longestWord)
        
        attributedString = NSMutableAttributedString(string: longString, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 20)])
        
        attributedString?.setAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 20), NSForegroundColorAttributeName : UIColor.red], range: longestWordRange)
        label.attributedText = attributedString
//        attributedString?.removeAttribute(NSForegroundColorAttributeName, range: longestWordRange)
//        label.attributedText = attributedString
        
    }
}










