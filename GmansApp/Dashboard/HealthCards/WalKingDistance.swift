//
//  WalKingDistance.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 05/05/24.
//

// MARK: - Hard Code Walking Distance Data
/*
This file will be displayed on Hardcode Walking Distance on Tab view
*/

import SwiftUI

struct WalKingDistance: View {
    
    @StateObject var viewModel = HealthCardsVM()
    @Binding var isLogOut: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    GmanAnimateImage(firstImage: "figure.walk.motion", secondImage: "figure.walk")
                    Spacer()
                    GmanHeading(heading:"Walking Distance")
                    Spacer()
                    GmanLogOutBtn(isLogOut: $isLogOut)
                }
                if viewModel.selectedDates.count > 0 {
                    GmanSubTitl(subTitl: "Selected Dates : \(viewModel.formattedDates)")
                }
                Spacer()
                GmanLineChart(chartData: MockData.barChartData)
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
    WalKingDistance(isLogOut: .constant(true))
}
