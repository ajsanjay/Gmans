//
//  MockData.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//


// MARK: - MockData
/*
 This file consists the sample data which is used in entire app
 */

import Foundation

struct MockData {
    
    static let heartRate: [(Double, Date)] = [
        (75.0, Date().addingTimeInterval(-3600)),  // 1 hour ago
        (80.0, Date().addingTimeInterval(-1800)),  // 30 minutes ago
        (85.0, Date())                              // Now
    ]
    
    static let pieChartData: [ChartDataPoint] = [
        ChartDataPoint(date: Date().addingTimeInterval(-86400 * 6), rate: 20, animate: false),
        ChartDataPoint(date: Date().addingTimeInterval(-86400 * 5), rate: 30, animate: false),
        ChartDataPoint(date: Date().addingTimeInterval(-86400 * 4), rate: 40, animate: false),
        ChartDataPoint(date: Date().addingTimeInterval(-86400 * 3), rate: 50, animate: false),
        ChartDataPoint(date: Date().addingTimeInterval(-86400 * 2), rate: 60, animate: false),
        ChartDataPoint(date: Date().addingTimeInterval(-86400 * 1), rate: 80, animate: false),
        ChartDataPoint(date: Date(), rate: 100, animate: false)
    ]
    
    static let barChartData: [ChartDataPoint] = [
        ChartDataPoint(date: Date().addingTimeInterval(-86400 * 6), rate: 20, animate: false),
        ChartDataPoint(date: Date().addingTimeInterval(-86400 * 5), rate: 30, animate: false),
        ChartDataPoint(date: Date().addingTimeInterval(-86400 * 4), rate: 80, animate: false),
        ChartDataPoint(date: Date().addingTimeInterval(-86400 * 3), rate: 90, animate: false),
        ChartDataPoint(date: Date().addingTimeInterval(-86400 * 2), rate: 95, animate: false),
        ChartDataPoint(date: Date().addingTimeInterval(-86400 * 1), rate: 100, animate: false),
        ChartDataPoint(date: Date(), rate: 70, animate: false)
    ]
    
}
