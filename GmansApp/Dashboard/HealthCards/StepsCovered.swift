//
//  StepsCovered.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 05/05/24.
//

// MARK: - Hard Code Steps Covered Data
/*
This file will be displayed on Hardcode Steps covered on Tab view
*/

import SwiftUI

struct StepsCovered: View {
    
    @StateObject var viewModel = HealthCardsVM()
    @Binding var isLogOut: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    GmanAnimateImage(firstImage: "figure.arms.open", secondImage: "figure.stand")
                    Spacer()
                    GmanHeading(heading:"Steps Covered")
                    Spacer()
                    GmanLogOutBtn(isLogOut: $isLogOut)
                }
                if viewModel.selectedDates.count > 0 {
                    GmanSubTitl(subTitl: "Selected Dates : \(viewModel.formattedDates)")
                }
                GmansBarChart(chartData: MockData.barChartData)
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
    StepsCovered(isLogOut: .constant(true))
}
