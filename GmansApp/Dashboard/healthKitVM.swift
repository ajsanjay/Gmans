//
//  healthKitVM.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import Foundation
import HealthKit

@MainActor 
final class HealthKitManager: ObservableObject {
    
    let healthStore = HKHealthStore()
    @Published private(set) var isAuthorized: Bool = false
    
    init() {
        // Check and update authorization status on initialization
        updateAuthorizationStatus()
    }
    
    private func updateAuthorizationStatus() {
        let status = healthStore.authorizationStatus(for: HKObjectType.quantityType(forIdentifier: .heartRate)!)
        isAuthorized = status == .sharingAuthorized
    }

    func requestAuthorization() {
        let typesToRead: Set<HKSampleType> = [
            HKObjectType.quantityType(forIdentifier: .heartRate)!
        ]
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
            if let error = error {
                print("Error requesting authorization: \(error.localizedDescription)")
            }
            if success {
                self.isAuthorized = true
                print("Authorization granted")
            } else {
                self.isAuthorized = false
                print("Authorization denied")
            }
        }
    }
    
    func fetchHeartRateData(completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
        let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)!
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        let query = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: nil) { query, results, error in
            guard let samples = results as? [HKQuantitySample], error == nil else {
                completion(nil, error)
                return
            }
            completion(samples, nil)
        }
        
        healthStore.execute(query)
    }
    
}
