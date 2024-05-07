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
    
    @State private var animationAmount: CGFloat = 1
    @State var chartData: [PiChartDataPoint]
    
    var body: some View {
        ZStack {
            HeartView()
                .frame(width: 40, height: 40)
                .scaleEffect(animationAmount)
                .animation(
                    .spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.8)
                    .delay(0.2)
                    .repeatForever(autoreverses: true),
                    value: animationAmount
                )
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
            animationAmount = 1.2
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
    GmansPiChart(chartData: MockData.pieChartData)
}
