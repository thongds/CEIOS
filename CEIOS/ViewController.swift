//
//  ViewController.swift
//  CEIOS
//
//  Created by SSd on 11/9/16.
//  Copyright © 2016 SSd. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AppProgressBarOnclick {
    
    let localhost =  "http://192.168.1.102/blog/public/uploads/02.mp3"
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    lazy var downloadSession : URLSession = {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        return session
    }()

    func mainView() {
        let button = UIButton(frame: CGRect(x: view.bounds.size.width/2-50, y:  view.bounds.size.height/2-50, width: 100, height:100))
        button.backgroundColor = UIColor.blue
        self.view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = UIColor.clear
        navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [ NSForegroundColorAttributeName : UIColor.white]
        
        // navigation Controll
        let backButton = UIBarButtonItem(image: UIImage(named : "back_image"), style: .plain, target: self, action: #selector(ViewController.backAction))
        backButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.title = "Fire and Waster"
        // header
        let viewHeader = HeaderViewBackground(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height/2))
        viewHeader.translatesAutoresizingMaskIntoConstraints = false
        viewHeader.bounds = viewHeader.frame
        let widthLabel = (viewHeader.bounds.size.width * 2)/3
        let heighLabel = viewHeader.bounds.size.height/2
        let xValue = viewHeader.bounds.size.width/2-widthLabel/2
       
        let textView = UILabel(frame: CGRect(x: xValue, y: (viewHeader.bounds.size.height/2) - heighLabel/2, width: widthLabel, height: heighLabel))
        textView.numberOfLines = 0
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "American History and Culture opens on Sept. 24 in Washington after a long journey. Thirteen years since Congress and President George W. Bush authorized its .American History and Culture opens on Sept. 24 in Washington after a long journey. Thirteen years since Congress and President George W. Bush authorized its .American History and Culture opens on Sept. 24 in Washington after a long journey. Thirteen years since Congress and President George W. Bush authorized its "
        let showMoreImage = UIImage(named: "show_more")
        let showMoreImageView = UIImageView(image: showMoreImage)
        
        showMoreImageView.frame = CGRect(x: viewHeader.bounds.size.width/2 - (showMoreImage?.size.width)!/2, y: viewHeader.bounds.size.height-(showMoreImage?.size.height)!-8 , width: (showMoreImage?.size.width)!, height: (showMoreImage?.size.height)!)
        showMoreImageView.translatesAutoresizingMaskIntoConstraints = false
        viewHeader.addSubview(showMoreImageView)
        viewHeader.addSubview(textView)
        view.addSubview(viewHeader)
        // view Body 
        let viewBodyHolder = UIView(frame: CGRect(x: 0, y: view.bounds.size.height/2, width: view.bounds.size.width, height: view.bounds.size.height/2))
        viewBodyHolder.translatesAutoresizingMaskIntoConstraints = false
        viewBodyHolder.backgroundColor = UIColor.white
        view.addSubview(viewBodyHolder)
        
        let viewProgressBarHolderWidth = viewBodyHolder.bounds.size.width*8/10
        let viewProgressBarHolderHeigh = viewBodyHolder.bounds.size.height*9/10
        let viewProgressBarHolder = UIView(frame: CGRect(x: viewBodyHolder.bounds.size.width/2 - viewProgressBarHolderWidth/2, y: viewBodyHolder.bounds.size.height/2 - viewProgressBarHolderHeigh/2, width: viewProgressBarHolderWidth, height: viewProgressBarHolderHeigh))
        viewProgressBarHolder.translatesAutoresizingMaskIntoConstraints = false
        viewProgressBarHolder.backgroundColor = UIColor.clear
        viewBodyHolder.addSubview(viewProgressBarHolder)
        
//        let sectionCircle = SectionCircle(frame: CGRect(x: 0, y: 0, width: viewProgressBarHolder.bounds.width/4, height: viewProgressBarHolder.bounds.width/4),textLabel: "Speaking")
//            sectionCircle.translatesAutoresizingMaskIntoConstraints = false
//            viewProgressBarHolder.addSubview(sectionCircle)
        let progressHeigt = viewProgressBarHolder.bounds.size.height*7/24
        let space = viewProgressBarHolder.bounds.size.height*1/24
        var rect = CGRect(x: 0, y: 0, width: viewProgressBarHolder.bounds.size.width, height: progressHeigt )
        let speakingProgress = AppProgressBar(frame: rect, textLabel: "Speaking",percentParam: 100,type: 1,callBack: self)
        speakingProgress.translatesAutoresizingMaskIntoConstraints = false
        rect.origin.y =  rect.origin.y + progressHeigt + space
        let listen = AppProgressBar(frame: rect, textLabel: "Listening", percentParam: 50,type: 2,callBack: self)
        listen.translatesAutoresizingMaskIntoConstraints = false
        rect.origin.y =  rect.origin.y + progressHeigt + space
        let newWord = AppProgressBar(frame: rect, textLabel: "New word", percentParam: 40,type: 3,callBack: self)
        newWord.translatesAutoresizingMaskIntoConstraints = false
        viewProgressBarHolder.addSubview(speakingProgress)
        viewProgressBarHolder.addSubview(listen)
        viewProgressBarHolder.addSubview(newWord)
    }
    
    func backAction() {
        
    }
    func onClick(type : Int){
        switch type {
        case 1:
            if let url = URL(string: localhost){
//                let downloadTask = downloadSession.downloadTask(with: url)
//                downloadTask.resume()
                if  let url = localFilePathForUrl(localhost) {
                    let viewController = SpeakingViewController()
                    viewController.url = url
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
                
            }
           
            break
        case 2:
            //let listeningViewController = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
            let scrollViewTab = ScrollViewTabViewController()
            navigationController?.pushViewController(scrollViewTab, animated: true)
        default: break
            
        }
        //self.navigationController?.pushViewController(viewController, animated: true)
    }
}
extension UIViewController: URLSessionDownloadDelegate {
    func localFilePathForUrl(_ previewUrl: String) -> URL? {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        if let url = URL(string: previewUrl){
            let lastPathComponent = url.lastPathComponent
            let fullPath = documentsPath.appendingPathComponent(lastPathComponent)
            return URL(fileURLWithPath:fullPath)
            
        }
        return nil
    }
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL){
        if let originalURL  = downloadTask.originalRequest?.url?.absoluteString, let destinationURL = localFilePathForUrl(originalURL) {
            print("originalURL \(originalURL) destinationURL \(destinationURL)")
            let fileManager = FileManager.default
            do{
                try fileManager.removeItem(at: destinationURL)
            }catch{
                 print("Could not removeItem: \(error.localizedDescription)")
            }
            do {
                try fileManager.copyItem(at: location, to: destinationURL)
                let viewController = SpeakingViewController()
                viewController.url = destinationURL
                self.navigationController?.pushViewController(viewController, animated: true)
            }
            catch let error as NSError{
                print("Could not copy file to disk: \(error.localizedDescription)")
            }
        }
        
//        if let url = downloadTask.originalRequest?.url?.absoluteString {
//            activeDownloads[url] = nil
//            // 4
//            if let trackIndex = trackIndexForDownloadTask(downloadTask: downloadTask) {
//                DispatchQueue.main.async{
//                    let indexPath = IndexPath(row: trackIndex, section: 0)
//                    self.tableView.reloadRows(at: [indexPath], with: .none)
//                }
//            }
//        }
      
        
    }
    
}


