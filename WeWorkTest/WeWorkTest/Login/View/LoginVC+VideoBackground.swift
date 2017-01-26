//
//  LoginVC+VideoBackground.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/26/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit
import AVFoundation

extension LoginVC {

    func setUpVideoBackground() {
        let theURL = Bundle.main.url(forResource:"GithubVideo", withExtension: "mp4")
        
        welAvPlayer = AVPlayer(url: theURL!)
        welAvPlayerLayer = AVPlayerLayer(player: welAvPlayer)
        welAvPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        welAvPlayer.volume = 0
        welAvPlayer.actionAtItemEnd = .none
        
        welAvPlayerLayer.frame = view.bounds
        welAvPlayerLayer.frame.size.height = view.bounds.height + 100
        welAvPlayerLayer.frame.origin.y = view.bounds.origin.y - 50
        
        view.backgroundColor = .clear
        view.layer.insertSublayer(welAvPlayerLayer, at: 0)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: welAvPlayer.currentItem)
    }
    
    func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        welAvPlayer.play()
        welPaused = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        welAvPlayer.pause()
        welPaused = true
    }

}
