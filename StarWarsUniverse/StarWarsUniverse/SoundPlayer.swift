//
//  SoundPlayer.swift
//  StarWarsSwift
//
//  Created by Jose Manuel Franco on 17/5/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

import UIKit
import AVFoundation

class SoundPlayer : NSObject {
    
    /// The player.
    var avPlayer:AVAudioPlayer!
    
    /**
    Uses AvAudioPlayer to play a sound file.
    The player instance needs to be an instance variable. Otherwise it will disappear before playing.
    */
    func readFileIntoAVPlayer(url:NSURL) {
        
        var error: NSError?
        
        // the player must be a field. Otherwise it will be released before playing starts.
        self.avPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        if avPlayer == nil {
            if let e = error {
                println(e.localizedDescription)
            }
        }
        
        avPlayer.delegate = self
        avPlayer.prepareToPlay()
        avPlayer.volume = 1.0
        avPlayer.play()
    }
    
    func stopAVPLayer() {
        if avPlayer.playing {
            avPlayer.stop()
        }
    }
    
    func toggleAVPlayer() {
        if avPlayer.playing {
            avPlayer.pause()
        } else {
            avPlayer.play()
        }
    }
}

// MARK: AVAudioPlayerDelegate
extension SoundPlayer : AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        println("finished playing \(flag)")
    }
    
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!, error: NSError!) {
        println("\(error.localizedDescription)")
    }
    
}
