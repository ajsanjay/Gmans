//
//  GmansPiChart.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 06/05/24.
//

import SwiftUI
import Charts

struct PiChartDataPoint {
    let date: Date
    let rate: Double
    var animate: Bool
}

struct GmansPiChart: View {
    
    @State var chartData: [PiChartDataPoint]
    
    var body: some View {
        ZStack {
            Chart(chartData, id: \.rate) { dataItem in
                SectorMark(
                    angle: .value("T", dataItem.animate ? dataItem.rate : 0),
                    innerRadius: .ratio(0.5),
                    angularInset: 1.5
                )
                .opacity(dataItem.rate > 50 ? 1 : 0.4)
                .cornerRadius(10)
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
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.5) {
                    withAnimation(.easeInOut(duration: 0.8)) {
                        chartData[index].animate = false
                    }
                }
            }
        }
    }
    
}

#Preview {
    GmansPiChart(chartData: MockData.pieChartData)
}
