//
//  WalKingDistance.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 05/05/24.
//

import SwiftUI

struct WalKingDistance: View {
    
    @State private var isWalking = false
    @State private var timer: Timer? = nil
    @State private var displayCalender: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Image(systemName: isWalking ? "figure.walk.motion" : "figure.walk")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.red)
                        .padding(.leading, -180)
                    GmanHeading(heading:"Walking Distance")
                }
                Button(action: {
                    displayCalender.toggle()
                }) {
                    GmanButton(buttonTitle: "Select Dates")
                }
                .padding()
                if displayCalender {
                    GmansCalender(hideCalender: $displayCalender)
                } else {
                    
                }
                Spacer()
            }
        }
        .onAppear {
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.isWalking.toggle()
            }
        }
        .onDisappear {
            self.timer?.invalidate()
            self.timer = nil
        }
    }
}

#Preview {
    WalKingDistance()
}
