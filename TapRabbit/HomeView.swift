//
//  WelcomeView.swift
//  TapRabbit
//
//  Created by Kaan Esendemir on 5/12/20.
//  Copyright © 2020 Kaan Esendemir. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        ZStack {
            
            // Set background color
            Color("PowderBlue")
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Text("TapRabbit").font(.custom("Varela Round", size: 45)).foregroundColor(.white).shadow(radius: 2)
                Text("Simply tap the rabbits!").font(.custom("Varela Round", size: 20)).foregroundColor(.white).shadow(radius: 2)
                
                Spacer()
                Image("rabbit1").resizable().frame(width: 200, height: 300)
                
                Spacer()
                
                Button(action: goToGameView) {
                    HStack(alignment: .center) {
                        Text("Play").font(.custom("Varela Round", size: 26)).foregroundColor(Color("PowderBlue"))
                    }
                }.frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 70)
                .foregroundColor(.blue)
                .font(.system(size: 14, weight: .bold))
                .background(Color.white)
                .cornerRadius(5)
                .padding(.bottom, 10)
                    
                HStack {
                    // Button to navigate to high score screen
                    Button(action: goToScoreView) {
                        HStack(alignment: .center) {
                            Text("Score").font(.custom("Varela Round", size: 26)).foregroundColor(Color("PowderBlue"))
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 70)
                    .font(.system(size: 14, weight: .bold))
                    .background(Color.white)
                    .cornerRadius(5)
                    
                    // Button to navigate to App Store link
                    Button(action: {
                        let url: URL = URL(string: "https://www.kaanesendemir.com")! as URL
                        UIApplication.shared.open(url as URL)
                    }) {
                        HStack(alignment: .center) {
                            Text("Creator").font(.custom("Varela Round", size: 26)).foregroundColor(Color("PowderBlue"))
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
