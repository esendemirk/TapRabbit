//
//  PlaySound.swift
//  TapRabbit
//
//  Created by Kaan Esendemir on 5/12/20.
//  Copyright © 2020 Kaan Esendemir. All rights reserved.
//

import Foundation
import AVFoundation

// MARK: - AUDIO PLAYER

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error playing sound file. Check that it exists.")
        }
    }
}
