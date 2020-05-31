//
//  Navigate.swift
//  TapRabbit
//
//  Created by Kaan Esendemir on 5/14/20.
//  Copyright © 2020 Kaan Esendemir. All rights reserved.
//

import SwiftUI

// Navigate to home screen
func goToHomeView() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: HomeView())
        window.makeKeyAndVisible()
    }
}

// Navigate to game screen
func goToGameView() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: GameView())
        window.makeKeyAndVisible()
    }
}

// Navigate to highscore screen
func goToScoreView() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ScoreView())
        window.makeKeyAndVisible()
    }
}

// Navigate to game over screen
func goToGameOverView() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: GameOverView())
        window.makeKeyAndVisible()
    }
}


