//
//  StepsCovered.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 05/05/24.
//

import SwiftUI

struct StepsCovered: View {
    
    @State private var isWalking = false
    @State private var timer: Timer? = nil
    @State private var displayCalender: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Image(systemName: isWalking ? "figure.arms.open" : "figure.stand")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.red)
                        .padding(.leading, -160)
                    GmanHeading(heading:"Steps Covered")
                }
                Spacer()
                GmansBarChart(chartData: MockData.barChartData)
                Spacer()
                Button(action: {
                    displayCalender.toggle()
                }) {
                    GmanButton(buttonTitle: "Select Dates")
                }
                .padding()
                if displayCalender {
                    GmansCalender(hideCalender: $displayCalender)
                }
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
    StepsCovered()
}
