//
//  HardCodeHeathData.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import SwiftUI
import HealthKit

struct HardCodeHeathData: View {
    
    @StateObject var healthKitManager = HealthKitManager()
    @State private var heartRateData: [HKQuantitySample] = []
    
    @State private var currentIndex = 0
        
    var body: some View {
        ZStack {
            GmansBGView()
            VStack {
                if healthKitManager.isHeartRateAuthorized {
                    TabView(selection: $currentIndex) {
                        HeartRate(heartRateData: heartRateData)
                            .tag(0)
                        WalKingDistance()
                            .tag(1)
                        StepsCovered()
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
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
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
    HardCodeHeathData()
}
