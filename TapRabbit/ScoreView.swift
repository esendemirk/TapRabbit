//
//  ScoreView.swift
//  TapRabbit
//
//  Created by Kaan Esendemir on 5/12/20.
//  Copyright © 2020 Kaan Esendemir. All rights reserved.
//

import SwiftUI

struct ScoreView: View {
    
    @State var highScore = UserDefaults.standard.integer(forKey: "highScore")

    @ViewBuilder
    var body: some View {
        
         ZStack {
            
            // Set background color
            Color("PowderBlue")
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Text("HIGH SCORE").font(.custom("Varela Round", size: 60)).foregroundColor(.white).shadow(radius: 4).multilineTextAlignment(.center)
                
                Spacer()
 
                Text("\(highScore)").font(.custom("Varela Round", size: 60)).foregroundColor(.white)
                
                Spacer()
                    
                    Button(action: goToHomeView) {
                        HStack(alignment: .center) {
                            Text("Menu").font(.custom("Varela Round", size: 26)).foregroundColor(Color("PowderBlue"))
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 70)
                    .font(.system(size: 14, weight: .bold))
                    .background(Color.white)
                    .cornerRadius(5)
                
                Spacer()
                
            }.padding(.horizontal, 70)
        }
        
        // Google Banner Ad View
        AdView().frame(minWidth: 0, maxWidth: .infinity).frame(height: 70)
    }
}
