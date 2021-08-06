//
//  VisualBlur.swift
//  VisualBlur
//
//  Created by Milad Golchinpour on 8/4/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI


#if os(macOS)
/// Background Blur Effect for macOS
struct BlurEffectMac: NSViewRepresentable {
    let material: NSVisualEffectView.Material
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.state = .active
        
        return visualEffectView
    }

    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
        visualEffectView.material = material
    }
}
#else

/// Background Blur Effect for iOS
struct BlurEffectIos: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
#endif
