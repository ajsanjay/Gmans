//
//  MockData.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import Foundation

struct MockData {
    
    static let heartRate: [(Double, Date)] = [
        (75.0, Date().addingTimeInterval(-3600)),  // 1 hour ago
        (80.0, Date().addingTimeInterval(-1800)),  // 30 minutes ago
        (85.0, Date())                              // Now
    ]
    
}
