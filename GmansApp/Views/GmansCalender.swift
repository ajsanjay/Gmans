//
//  GmansCalender.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 06/05/24.
//

import SwiftUI

struct GmansCalender: View {
    
    @State private var selectedDates: Set<DateComponents> = []
//    @State private var displayedMonth: Date = Date()
//    @State private var selectedDate: Date = Date()

    var body: some View {
        VStack {
//            Text("Selected Dates: \(formattedDates)")
//                .padding()
            
            
//            DatePicker("Select Days",
//                       selection: $selectedDate,
//                       in: Date()...,
//                       displayedComponents: .date)
//            .padding()
            MultiDatePicker("Select Days", selection: $selectedDates)
                .padding()
                .frame(height: 400)

          /*  HStack {
                Button(action: {
                    displayedMonth = Calendar.current.date(byAdding: .month, value: -1, to: displayedMonth)!
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                .padding(.horizontal)

                Text(monthYearFormatter.string(from: displayedMonth))
                    .font(.headline)

                Button(action: {
                    displayedMonth = Calendar.current.date(byAdding: .month, value: 1, to: displayedMonth)!
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
            } */

            /*LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 10) {
                ForEach(weekdays, id: \.self) { weekday in
                    Text(weekday)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color.secondary.opacity(0.2))
                }

                ForEach(calendarDays(), id: \.self) { day in
                    DayCell(date: day, isSelected: selectedDates.contains(day)) {
                        toggleSelection(for: day)
                    }
                }
            }
            .padding() */
        }
    }

    /*   private var weekdays: [String] {
        let formatter = DateFormatter()
        return formatter.shortWeekdaySymbols.map { $0.uppercased() }
    }

    private func calendarDays() -> [Date] {
        let calendar = Calendar.current
        var startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: displayedMonth))!
        
        // Find the first Sunday of the month
        while calendar.component(.weekday, from: startDate) != 1 {
            startDate = calendar.date(byAdding: .day, value: -1, to: startDate)!
        }

        var dates: [Date] = []
        var currentDate = startDate
        while currentDate <= displayedMonth.endOfMonth {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        return dates
    }

    private func toggleSelection(for date: Date) {
        if selectedDates.contains(date) {
            selectedDates.remove(date)
        } else {
            selectedDates.insert(date)
        }
    }

    private var formattedDates: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return selectedDates
            .sorted()
            .map { formatter.string(from: $0) }
            .joined(separator: ", ")
    }

    private let monthYearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()*/
}

struct DayCell: View {
    let date: Date
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        VStack {
            Text("\(dayOfMonth(date))")
                .font(.headline)
                .foregroundColor(isSelected ? .white : .primary)
        }
        .frame(width: 40, height: 40)
        .background(isSelected ? Color.blue : Color.clear)
        .clipShape(Circle())
        .onTapGesture(perform: action)
    }

    private func dayOfMonth(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }

    private func dayOfWeek(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date).prefix(3).uppercased()
    }
}

extension Date {
    var endOfMonth: Date {
        let calendar = Calendar.current
        if let plusOneMonth = calendar.date(byAdding: .month, value: 1, to: self) {
            return calendar.date(byAdding: .day, value: -1, to: plusOneMonth)!
        } else {
            return self
        }
    }
}

#Preview {
    GmansCalender()
}
