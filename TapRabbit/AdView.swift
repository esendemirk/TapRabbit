//
//  AdView.swift
//  TapRabbit
//
//  Created by Kaan Esendemir on 5/14/20.
//  Copyright © 2020 Kaan Esendemir. All rights reserved.
//

import SwiftUI
import GoogleMobileAds

struct AdView : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<AdView>) -> GADBannerView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        
        banner.adUnitID = "ca-app-pub-2889690908110543/4246241580"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }
    
    func updateUIView(_ uiView: GADBannerView, context: UIViewRepresentableContext<AdView>) {
    }
}
