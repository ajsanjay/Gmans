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

struct HeartView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 20, height: 20, alignment: .center)
                .foregroundColor(.red)
                .cornerRadius(5)
            
            Circle()
                .frame(width: 20, height: 20, alignment: .center)
                .foregroundColor(.red)
                .padding(.top, -20)
            
            Circle()
                .frame(width: 20, height: 20, alignment: .center)
                .foregroundColor(.red)
                .padding(.trailing, -20)
        }
        .rotationEffect(Angle(degrees: -45))
    }
}

#Preview {
    GmansSplashBG()
}
