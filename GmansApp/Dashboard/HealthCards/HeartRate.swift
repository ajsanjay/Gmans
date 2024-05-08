//
//  HeartRate.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 05/05/24.
//

import SwiftUI
import HealthKit

struct HeartRate: View {
    
    @State private var animationAmount: CGFloat = 1
    @State private var displayCalender: Bool = false
    
    var heartRateData: [HKQuantitySample] = []
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    HeartView()
                        .frame(width: 40, height: 40)
                        .scaleEffect(animationAmount)
                        .animation(
                            .spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.8)
                            .delay(0.2)
                            .repeatForever(autoreverses: true),
                            value: animationAmount
                        )
                        .padding(.leading, -130)
                    GmanHeading(heading:"Heart Rate")
                }
                GmansPiChart(chartData: MockData.pieChartData)
                Spacer()
                Button(action: {
                    displayCalender.toggle()
                }) {
                    GmanButton(buttonTitle: displayCalender == true ? "Done" : "Select Dates")
                }
                .padding()
                if displayCalender {
                    GmansCalender(hideCalender: $displayCalender)
                }
            }
            .padding(.bottom, 30)
        }
        .onAppear() {
            animationAmount = 1.2
        }
    }
    
}

#Preview {
    HeartRate()
}
