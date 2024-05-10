//
//  StepsCovered.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 05/05/24.
//

import SwiftUI

struct StepsCovered: View {
    
    @StateObject var viewModel = HealthCardsVM()
    @Binding var isLogOut: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: viewModel.isWalking ? "figure.arms.open" : "figure.stand")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.red)
                        .padding()
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
        .onAppear {
            viewModel.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                viewModel.isWalking.toggle()
            }
        }
        .onDisappear {
            viewModel.timer?.invalidate()
            viewModel.timer = nil
        }
    }
    
}

#Preview {
    StepsCovered(isLogOut: .constant(true))
}
