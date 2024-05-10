//
//  WalKingDistance.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 05/05/24.
//

import SwiftUI

struct WalKingDistance: View {
    
    @StateObject var viewModel = HealthCardsVM()
    @Binding var isLogOut: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: viewModel.isWalking ? "figure.walk.motion" : "figure.walk")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.red)
                        .padding()
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
    WalKingDistance(isLogOut: .constant(true))
}
