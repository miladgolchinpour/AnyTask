//
//  Extensions.swift
//  Extensions
//
//  Created by Milad Golchinpour on 8/4/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

// Blur Background Style View
extension View {
    func blurStyle() -> some View {
        self
            .padding()
        #if os(macOS)
            .background(BlurEffectMac(material: .fullScreenUI))
        #else
            .background(BlurEffectIos(style: .systemThinMaterial))
        #endif
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

// Make Optional working for TextField and DatePicker
func ??<T>(binding: Binding<T?>, fallback: T) -> Binding<T> {
  return Binding(get: {
    binding.wrappedValue ?? fallback
  }, set: {
    binding.wrappedValue = $0
  })
}
