//
//  WalKingDistance.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 05/05/24.
//

import SwiftUI

struct WalKingDistance: View {
    
    @State private var isWalking = false
    @State private var timer: Timer? = nil
    @State private var displayCalender: Bool = false
    @State private var selectedDates: Set<DateComponents> = []
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Image(systemName: isWalking ? "figure.walk.motion" : "figure.walk")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.red)
                        .padding(.leading, -180)
                    GmanHeading(heading:"Walking Distance")
                }
                if selectedDates.count > 0 {
                    Text("Selected Dates : \(formattedDates)")
                }
                GmanLineChart(chartData: MockData.barChartData)
                Spacer()
                Button(action: {
                    displayCalender.toggle()
                }) {
                    GmanButton(buttonTitle: displayCalender == true ? "Done" : "Select Dates")
                }
                .padding()
                if displayCalender {
                    GmansCalender(selectedDates: $selectedDates, hideCalender: $displayCalender)
                }
            }
            .padding(.bottom, 30)
        }
        .onAppear {
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.isWalking.toggle()
            }
        }
        .onDisappear {
            self.timer?.invalidate()
            self.timer = nil
        }
    }
    
    private var formattedDates: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        let sortedDates = selectedDates.sorted { date1, date2 in
            guard let date1 = Calendar.current.date(from: date1),
                  let date2 = Calendar.current.date(from: date2) else {
                return false
            }
            return date1 < date2
        }
        
        return sortedDates
            .compactMap { Calendar.current.date(from: $0) }
            .map { formatter.string(from: $0) }
            .joined(separator: ", ")
    }
    
}

#Preview {
    WalKingDistance()
}
