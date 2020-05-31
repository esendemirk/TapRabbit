//
//  GameOverView.swift
//  TapRabbit
//
//  Created by Kaan Esendemir on 5/13/20.
//  Copyright © 2020 Kaan Esendemir. All rights reserved.
//

import SwiftUI
import GoogleMobileAds

struct GameOverView: View {
    @State var score = UserDefaults.standard.integer(forKey: "score")
    @State var highScore = UserDefaults.standard.integer(forKey: "highScore")

    @ViewBuilder
    var body: some View {
        
         ZStack {
            
            // Set background color
            Color("PowderBlue")
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Text("GAME OVER").font(.custom("Varela Round", size: 60)).foregroundColor(.white).shadow(radius: 4).multilineTextAlignment(.center)
                
                Spacer()
                VStack {
                    Text("Score").font(.custom("Varela Round", size: 40)).foregroundColor(.white).shadow(radius: 2)
                    Text("\(score)").font(.custom("Varela Round", size: 40)).foregroundColor(.white)
                    Text("Best").font(.custom("Varela Round", size: 40)).foregroundColor(.white).shadow(radius: 2)
                    Text("\(highScore)").font(.custom("Varela Round", size: 40)).foregroundColor(.white)
                }
                
                Spacer()
                
                HStack {
                    Button(action: goToGameView) {
                        HStack(alignment: .center) {
                            Text("Restart").font(.custom("Varela Round", size: 26)).foregroundColor(Color("PowderBlue"))
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 70)
                    .font(.system(size: 14, weight: .bold))
                    .background(Color.white)
                    .cornerRadius(5)
                    
                    Button(action: goToHomeView) {
                        HStack(alignment: .center) {
                            Text("Menu").font(.custom("Varela Round", size: 26)).foregroundColor(Color("PowderBlue"))
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 70)
                    .font(.system(size: 14, weight: .bold))
                    .background(Color.white)
                    .cornerRadius(5)
                }

                
                Spacer()
                
            }.padding(.horizontal, 70)
        }
        
        // Google Banner Ad View
        AdView().frame(minWidth: 0, maxWidth: .infinity).frame(height: 70)
    }  
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
