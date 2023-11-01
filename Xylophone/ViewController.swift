//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func playSound(note sound: String){
        guard let sound = Bundle.main.path(forResource: "C", ofType: "wav") else {
            print("Error getting the wav file from the main bundle.")
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default )
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
        } catch {
            print("Audio file error.")
        }
        audioPlayer.play()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(note: "C")
    }
    

}

