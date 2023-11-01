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
    
    func playSound(note noteSound: String){
        guard let sound = Bundle.main.path(forResource: noteSound, ofType: "wav") else {
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
        changeButtonOpacity(buttonPressed: sender)
        let musicalNotePressed: String = sender.titleLabel?.text ?? "C"
        playSound(note: musicalNotePressed)
    }
    
    func changeButtonOpacity(buttonPressed: UIButton){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 )
                {
                    UIView.animate(withDuration: 0.3)
                    {
                        buttonPressed.alpha = 1.0
                    }
                }
    }

}

