//
//  HeartView.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 07/05/24.
//

// MARK: - HeartView
/*
 This file will display a animated heart shaped object
*/

import SwiftUI

struct HeartView: View {
    
    @State private var animationAmount: CGFloat = 1
    
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
        .scaleEffect(animationAmount)
        .animation(
            .spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.8)
            .delay(0.2)
            .repeatForever(autoreverses: true),
            value: animationAmount)
        .onAppear {
            animationAmount = 1.2
        }
    }
}

#Preview {
    HeartView()
}
