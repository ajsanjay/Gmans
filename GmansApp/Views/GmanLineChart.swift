//
//  GmanLineChart.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 07/05/24.
//

// MARK: - Line chart
/*
 This file contains Line chart functionality
 - iOS 17 introduced new Chart Api's Which is used here
*/

import SwiftUI
import Charts

struct GmanLineChart: View {
    
    @StateObject var viewModel = ChartsViewModel()
    @State var chartData: [ChartDataPoint]
    
    var body: some View {
        Chart {
            ForEach(0..<chartData.count, id: \.self) { index in
                LineMark(
                    x: .value("Type", "\(viewModel.formattedDate(date: chartData[index].date))"),
                    y: .value("Average", chartData[index].animate ? chartData[index].rate : 0))
                .foregroundStyle(Color("ChartLine"))
                .foregroundStyle(Color("ChartFill").gradient)
                    .interpolationMethod(.catmullRom)
                AreaMark(
                    x: .value("Type", "\(viewModel.formattedDate(date: chartData[index].date))"),
                    y: .value("Average", chartData[index].animate ? chartData[index].rate : 0))
                .foregroundStyle(Color("ChartFill").opacity(0.1).gradient)
                    .interpolationMethod(.catmullRom)
                
                if viewModel.showAverage {
                    RuleMark(y: .value("Average", 50))
                        .foregroundStyle(Color("ChartFill"))
                        .annotation(position: .top, alignment: .bottomLeading) {
                            Text("Average 50")
                                .foregroundColor(.white)
                        }
                }
            }
        }
        .padding()
        .chartYScale(domain: 0...100)
        .aspectRatio(1, contentMode: .fit)
        Toggle(isOn: $viewModel.showAverage) {
            Text(viewModel.showAverage ? "Show Average" : "Hide Average")
        }
        .foregroundColor(.white)
        .tint(Color("ChartFill"))
        .padding()
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
    GmanLineChart(chartData: MockData.barChartData)
}
