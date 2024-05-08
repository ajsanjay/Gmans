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
    var animate: Bool
}

struct GmansBarChart: View {
    
    @State private var showAverage: Bool = false
    @State var chartData: [BarChartDataPoint]
    
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter.string(from: date)
    }

    var body: some View {
        Chart {
            ForEach(0..<chartData.count, id: \.self) { index in
                BarMark(x: .value("Type", "\(formattedDate(date: chartData[index].date))"), y: .value("Average", chartData[index].animate ? chartData[index].rate : 0))
                    .foregroundStyle(.chartFill)
                    .opacity(chartData[index].rate > 60 ? 1 : 0.5)
                    .cornerRadius(15)
                
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
