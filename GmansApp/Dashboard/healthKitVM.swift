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
    
    @Published private(set) var isHeartRateAuthorized: Bool = false
    @Published private(set) var isStepCountAuthorized: Bool = false
    @Published private(set) var isWalkingAuthorized: Bool = false
    @Published var stepsCount: Double?
    
    init() {
        // Check and update authorization status on initialization
        updateAuthorizationStatus()
    }
    
    private func updateAuthorizationStatus() {
        let heartRateStatus = healthStore.authorizationStatus(for: HKObjectType.quantityType(forIdentifier: .heartRate)!)
        isHeartRateAuthorized = heartRateStatus == .sharingAuthorized
        
        let stepCountStatus = healthStore.authorizationStatus(for: HKObjectType.quantityType(forIdentifier: .stepCount)!)
        isStepCountAuthorized = stepCountStatus == .sharingAuthorized

    }

    func requestAuthorization() {
        let typesToRead: Set<HKSampleType> = [
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
            HKObjectType.quantityType(forIdentifier: .heartRate)!
        ]
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
            if let error = error {
                print("Error requesting authorization: \(error.localizedDescription)")
            }
            if success {
                self.isHeartRateAuthorized = true
                self.isStepCountAuthorized = true
                self.isWalkingAuthorized = true
                print("Authorization granted")
            } else {
                self.isHeartRateAuthorized = false
                self.isStepCountAuthorized = false
                self.isWalkingAuthorized = false
                print("Authorization denied")
            }
        }
    }
    
    func fetchStepCount() {
        let type = HKObjectType.quantityType(forIdentifier: .stepCount)!
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: today, end: Date(), options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum) { query, result, error in
            if let result = result, let sum = result.sumQuantity() {
                if (error != nil) { return }
                let steps = sum.doubleValue(for: HKUnit.count())
                if steps > 0 {
                    self.stepsCount = steps
                }
            }
        }
        healthStore.execute(query)
    }
    
    
    func fetchSteps(completion: @escaping (Double?, Error?) -> Void) {
        fetchQuantityData(typeIdentifier: .stepCount, unit: .count(), completion: completion)
    }
    
    func fetchDistance(completion: @escaping (Double?, Error?) -> Void) {
        fetchQuantityData(typeIdentifier: .distanceWalkingRunning, unit: .meter(), completion: completion)
    }
    
   /* func fetchHeartRate(completion: @escaping (Double?, Error?) -> Void) {
        fetchQuantityData(typeIdentifier: .heartRate, unit: .count/min, completion: completion)
    } */
    
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
    
    private func fetchQuantityData(typeIdentifier: HKQuantityTypeIdentifier, unit: HKUnit, completion: @escaping (Double?, Error?) -> Void) {
        guard let type = HKObjectType.quantityType(forIdentifier: typeIdentifier) else {
            completion(nil, NSError(domain: "HealthKitManager", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid quantity type"]))
            return
        }
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: today, end: Date(), options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum) { query, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(nil, error)
                return
            }
            let value = sum.doubleValue(for: unit)
            completion(value, nil)
        }
        healthStore.execute(query)
    }
}
