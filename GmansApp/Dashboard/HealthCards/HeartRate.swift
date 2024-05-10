//
//  HeartRate.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 05/05/24.
//

// MARK: - Hard Code Heart rate Data
/*
This file will be displayed on Hardcode Heart data on Tab view
*/

import SwiftUI
import HealthKit

struct HeartRate: View {
    
    @StateObject var viewModel = HealthCardsVM()
    @Binding var isLogOut: Bool
    
    var heartRateData: [HKQuantitySample] = []
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    HeartView()
                        .frame(width: 40, height: 40)
                        .padding()
                    Spacer()
                    GmanHeading(heading:"Heart Rate")
                    Spacer()
                    GmanLogOutBtn(isLogOut: $isLogOut)
                }
                if viewModel.selectedDates.count > 0 {
                    GmanSubTitl(subTitl: "Selected Dates : \(viewModel.formattedDates)")
                }
                GmansPiChart(chartData: MockData.pieChartData)
                Spacer()
                Button(action: {
                    viewModel.displayCalender.toggle()
                }) {
                    GmanButton(buttonTitle: viewModel.displayCalender == true ? "Done" : "Select Dates")
                }
                .padding()
                if viewModel.displayCalender {
                    GmansCalender(selectedDates: $viewModel.selectedDates, hideCalender: $viewModel.displayCalender)
                }
            }
            .padding(.bottom, 30)
        }
    }
    
}

#Preview {
    HeartRate(isLogOut: .constant(true))
}
