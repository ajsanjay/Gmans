//
//  GmansSplashBG.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 03/05/24.
//

import SwiftUI

struct GmansSplashBG: View {
    
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        GmansBGView()
            .overlay(
                HeartView()
                    .frame(width: 20, height: 20)
                    .scaleEffect(animationAmount)
                    .animation(
                        .spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.8)
                        .delay(0.2)
                        .repeatForever(autoreverses: true),
                        value: animationAmount)
                    .onAppear {
                        animationAmount = 1.2
                    }
            )
    }
}

#Preview {
    GmansSplashBG()
}
