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
    @State private var selectedDates: Set<DateComponents> = []
    
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
                if selectedDates.count > 0 {
                    Text("Selected Dates : \(formattedDates)")
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
                    GmansCalender(selectedDates: $selectedDates, hideCalender: $displayCalender)
                }
            }
            .padding(.bottom, 30)
        }
        .onAppear() {
            animationAmount = 1.2
        }
    }
    
    private var formattedDates: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        let sortedDates = selectedDates.sorted { date1, date2 in
            guard let date1 = Calendar.current.date(from: date1),
                  let date2 = Calendar.current.date(from: date2) else {
                return false
            }
            return date1 < date2
        }
        
        return sortedDates
            .compactMap { Calendar.current.date(from: $0) }
            .map { formatter.string(from: $0) }
            .joined(separator: ", ")
    }
    
}

#Preview {
    HeartRate()
}
