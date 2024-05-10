//
//  HealthCardsVM.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 10/05/24.
//

// MARK: - HealthCardsVM
/*
This View model is used to handle the logics displayed on Tabs Heart rate, Walking Distance and Steps Covered
*/

import Foundation

final class HealthCardsVM: ObservableObject {
    
    @Published var selectedDates: Set<DateComponents> = []
    @Published var displayCalender: Bool = false
    @Published var isWalking = false
    
    var formattedDates: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM/dd"
        
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
