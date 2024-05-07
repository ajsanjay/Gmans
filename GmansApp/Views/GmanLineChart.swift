//
//  GmanLineChart.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 07/05/24.
//

import SwiftUI
import Charts

struct GmanLineChart: View {
    
    @State var chartData: [BarChartDataPoint]
    @State private var showAverage: Bool = false
    
    var body: some View {
        Chart {
            ForEach(0..<chartData.count, id: \.self) { index in
                LineMark(
                    x: .value("Type", "\(chartData[index].date)"),
                    y: .value("Average", chartData[index].animate ? chartData[index].rate : 0))
                .foregroundStyle(Color.blue.gradient)
                    .interpolationMethod(.catmullRom)
                AreaMark(
                    x: .value("Type", "\(chartData[index].date)"),
                    y: .value("Average", chartData[index].animate ? chartData[index].rate : 0))
                .foregroundStyle(Color.blue.opacity(0.1).gradient)
                    .interpolationMethod(.catmullRom)
                
                if showAverage {
                    RuleMark(y: .value("Average", 50))
                        .foregroundStyle(.gray)
                        .annotation(position: .top, alignment: .bottomLeading) {
                            Text("Average 50")
                        }
                }
            }
        }
        .padding()
        .chartYScale(domain: 0...100)
        .aspectRatio(1, contentMode: .fit)
        Toggle(showAverage ? "Show Average" : "Hide Average", isOn: $showAverage)
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
    }
}

#Preview {
    GmanLineChart(chartData: MockData.barChartData)
}