//
//  ContentView.swift
//  TapRabbit
//
//  Created by Kaan Esendemir on 5/11/20.
//  Copyright © 2020 Kaan Esendemir. All rights reserved.
//

import SwiftUI
import GoogleMobileAds

struct GameView: View {
    
    let images = ["rabbit1", "norabbit", "rabbit2", "rabbit3", "rabbit4", "rabbit5", "rabbit6", "rabbit7"]
    @State var activeImageIndex = 0 // Index of the currently displayed image
    @State var interstitial : GADInterstitial!
    @State var hasLost = false
    @State var score = 0 // The current score that the user is on
    @State var highScore = UserDefaults.standard.integer(forKey: "highScore") // The current score that the user is on
    @State var difficulty = 2.0 // The amount of time before switching image (higher score, faster image change)
    @State var timer: Timer.TimerPublisher = Timer.publish (every: 2, on: .main, in: .common)
    @ViewBuilder
    var body: some View {
        
        ZStack {
            
            // Full screen background
            Color("PowderBlue")
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                // Display current score
                Text("\(score)").font(.custom("Varela Round", size: 80)).foregroundColor(.white)
                
                //Spacer()
                
                // Display random rabbit images
                Image(images[activeImageIndex])
                    .gesture(
                    TapGesture()
                        .onEnded({
                            // Game logic
                            if (self.activeImageIndex != 1) {
                                
                                // Increment score since rabbit was tapped
                                self.score += 1
                                
                                // Play sound for tap feedback
                                playSound(sound: "tap", type: "mp3")
                                
                                // Print timer value aka difficulty to the console
                                print("The difficulty is currently:\(self.difficulty)")
                                
                                // Close out current timer
                                self.cancelTimer()
                                
                                // Update the difficulty
                                self.updateDifficulty()
                                
                                // Create new timer with updated difficulty
                                self.instantiateTimer(difficulty: self.difficulty)
                                
                                // Connect the timer
                                _ = self.timer.connect()
                                
                            } else {
                                // Game Over logic
                                print("Game Over")
                                
                                // Play sound
                                playSound(sound: "gameover", type: "mp3")
                                
                                // Set the score to high score if higher than last
                                if self.score > self.highScore {
                                    self.saveHighScore()
                                    self.saveCurrentScore()
                                } else {
                                    self.saveCurrentScore()
                                }
                                
                                // Stop the timer (comment out until gameoverview implemented)
                                self.cancelTimer()
                                
                                // Go to game over screen
                                goToGameOverView()
                                
                                // Display interstitial ad on game over
                                if self.interstitial.isReady {
                                    let root = UIApplication.shared.windows.first?.rootViewController
                                    self.interstitial.present(fromRootViewController: root!)
                               } else {
                                    print("Not Ready")
                               }
                            }
                            // Set random number to index to change image to random rabbit
                            self.activeImageIndex = Int(arc4random_uniform(UInt32(self.images.count)))
                        })
                )
                .onReceive(timer) { _ in
                    //self.activeImageIndex = (self.activeImageIndex + 1) % self.images.count
                    self.activeImageIndex = Int(arc4random_uniform(UInt32(self.images.count)))
                }
                
                Spacer()
                
            }.onAppear(perform: {
                
                // Request the interstitial ad from Google Admob network to load prior to displaying
                self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-2889690908110543/7247809442")
                let request = GADRequest()
                self.interstitial.load(request)
                
                // Start an initial timer so the game starts right away
                self.instantiateTimer(difficulty: self.difficulty)
                _ = self.timer.connect()
            })
        }
    }
    
    func instantiateTimer(difficulty: Double) {
        self.timer = Timer.publish (every: difficulty, on: .main, in: .common)
        return
    }

    func cancelTimer() {
        self.timer.connect().cancel()
        return
    }
    
    func updateDifficulty() {
        if difficulty > 0.015 {
            self.difficulty -= 0.015
        } else {
            difficulty = 0.015
        }
        
    }
    
    func saveHighScore() {
        UserDefaults.standard.set(score, forKey: "highScore")
    }
    
    func saveCurrentScore() {
        UserDefaults.standard.set(score, forKey: "score")
    }

    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}


