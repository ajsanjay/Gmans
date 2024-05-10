//
//  ChartsViewModel.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 10/05/24.
//

// MARK: - Chart View Model
/*
 - This file contains the dateformatter logic to be displayed on the pages where ChartsViewModel is used
 - ChartsViewModel is used in GmansBarChart, GmansPiChart, GmanLineChart
*/

import Foundation

struct ChartDataPoint {
    let date: Date
    let rate: Double
    var animate: Bool
}

final class ChartsViewModel: ObservableObject {
    
    @Published var showAverage: Bool = false
    
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter.string(from: date)
    }
    
}
