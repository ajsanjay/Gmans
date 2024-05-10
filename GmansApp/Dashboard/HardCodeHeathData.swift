//
//  HardCodeHeathData.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

// MARK: - Hard Code Healthkit Data
/*
This file will be displayed on Hardcode data on Tabbar
 - Here if authorized to access the health data heartRateData this will add dummy data
 - The Tab view will display Heart rate, Walking Distance and Steps covered
*/

import SwiftUI
import HealthKit

struct HardCodeHeathData: View {
    
    @StateObject var healthKitManager = HealthKitManager()
    @State private var heartRateData: [HKQuantitySample] = []
    @State private var currentIndex = 0
    @Binding var isLogOut: Bool
        
    var body: some View {
        ZStack {
            GmansBGView()
            VStack {
                if healthKitManager.isHeartRateAuthorized {
                    TabView(selection: $currentIndex) {
                        HeartRate(isLogOut: $isLogOut, heartRateData: heartRateData)
                            .tag(0)
                        WalKingDistance(isLogOut: $isLogOut)
                            .tag(1)
                        StepsCovered(isLogOut: $isLogOut)
                            .tag(2)
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                } else {
                    GmanSubTitl(subTitl: "Please grant access to HealthKit to see data.")
                        .padding()
                }
            }
        }
        .onAppear() {
            currentIndex = 0
            healthKitManager.requestAuthorization()
            addHeartDummyData()
        }
    }
    
    func addHeartDummyData() {
        DispatchQueue.global().async {
            for data in MockData.heartRate {
                let quantity = HKQuantity(unit: HKUnit.count().unitDivided(by: .minute()), doubleValue: data.0)
                let heartRateSample = HKQuantitySample(type: HKObjectType.quantityType(forIdentifier: .heartRate)!, quantity: quantity, start: data.1, end: data.1)
                DispatchQueue.main.async {
                    heartRateData.append(heartRateSample)
                }
            }
        }
    }
}

#Preview {
    HardCodeHeathData(isLogOut: .constant(true))
}
