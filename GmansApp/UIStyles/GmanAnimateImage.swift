//
//  GmanAnimateImage.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 10/05/24.
//

// MARK: - AnimateImage
/*
This file will toggle two diffrent system images provided
*/

import SwiftUI

struct GmanAnimateImage: View {
    
    @State private var isWalking: Bool = false
    @State private var timer: Timer? = nil
    
    var firstImage: String
    var secondImage: String
    
    var body: some View {
        Image(systemName: isWalking ? firstImage : secondImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
            .foregroundColor(.red)
            .padding()
            .onAppear {
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    isWalking.toggle()
                }
            }
            .onDisappear {
                timer?.invalidate()
                timer = nil
            }
    }
    
}

#Preview {
    GmanAnimateImage(firstImage: "figure.walk.motion", secondImage: "figure.walk")
}
