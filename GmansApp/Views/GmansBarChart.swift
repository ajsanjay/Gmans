//
//  GmansBarChart.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 06/05/24.
//

import SwiftUI
import Charts

struct GmansBarChart: View {
    
    @StateObject var viewModel = ChartsViewModel()
    @State var chartData: [ChartDataPoint]

    var body: some View {
        Chart {
            ForEach(0..<chartData.count, id: \.self) { index in
                BarMark(x: .value("Type", "\(viewModel.formattedDate(date: chartData[index].date))"), y: .value("Average", chartData[index].animate ? chartData[index].rate : 0))
                    .foregroundStyle(.chartFill)
                    .opacity(chartData[index].rate > 60 ? 1 : 0.5)
                    .cornerRadius(15)
                
                if viewModel.showAverage {
                    RuleMark(y: .value("Average", 50))
                        .foregroundStyle(.chartFill)
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
        .tint(.chartFill)
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
    GmansBarChart(chartData: MockData.barChartData)
}
