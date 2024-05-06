//
//  GmansBarChart.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 06/05/24.
//

import SwiftUI
import Charts

struct BarChartDataPoint {
    let date: Date
    let rate: Double
}

struct GmansBarChart: View {
    let chartData: [BarChartDataPoint]

    var body: some View {
        Chart {
            ForEach(0..<chartData.count, id: \.self) { index in
                BarMark(x: .value("Type", "\(chartData[index].date)"), y: .value("Average", chartData[index].rate))
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }

}

#Preview {
    let dataPoints = [
        BarChartDataPoint(date: Date().addingTimeInterval(-86400 * 6), rate: 100),
        BarChartDataPoint(date: Date().addingTimeInterval(-86400 * 5), rate: 30),
        BarChartDataPoint(date: Date().addingTimeInterval(-86400 * 4), rate: 80),
        BarChartDataPoint(date: Date().addingTimeInterval(-86400 * 3), rate: 90),
        BarChartDataPoint(date: Date().addingTimeInterval(-86400 * 2), rate: 35),
        BarChartDataPoint(date: Date().addingTimeInterval(-86400 * 1), rate: 95),
        BarChartDataPoint(date: Date(), rate: 20)
    ]
    
    return GmansBarChart(chartData: dataPoints)
}
