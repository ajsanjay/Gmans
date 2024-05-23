//
//  GmansPiChart.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 06/05/24.
//

// MARK: - Pie chart
/*
 This file contains pie chart functionality
 - iOS 17 introduced new Chart Api's Which is used here
*/

import SwiftUI
import Charts

struct GmansPiChart: View {
    
    @State var chartData: [ChartDataPoint]
    @StateObject var viewModel = ChartsViewModel()
    
    var body: some View {
        ZStack {
            Chart(chartData, id: \.rate) { dataItem in
                SectorMark(
                    angle: .value("T", dataItem.animate ? dataItem.rate : 0),
                    innerRadius: .ratio(0.5),
                    angularInset: 1.5
                )
                .foregroundStyle(Color("ChartFill"))
                .foregroundStyle(by: .value("Name", dataItem.date))
                .opacity(dataItem.rate > 50 ? 1 : 0.4)
                .cornerRadius(10)
                .annotation(position: .overlay) {
                    Text("\(viewModel.formattedDate(date: dataItem.date))")
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
        .onAppear() {
            for (index, _) in chartData.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.5) {
                    withAnimation(.easeInOut(duration: 0.8)) {
                        chartData[index].animate = true
                    }
                }
            }
        }
        .onDisappear() {
            for (index, _) in chartData.enumerated() {
                chartData[index].animate = false
            }
        }
    }
    
}

#Preview {
    GmansPiChart(chartData: MockData.pieChartData)
}
