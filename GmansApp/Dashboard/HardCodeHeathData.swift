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
    
    var body: some View {
        ZStack {
            GmansBGView()
            VStack {
                GmanHeading(heading: "Hardcode Data")
                    .padding()
                Spacer()
                if healthKitManager.isHeartRateAuthorized {
                    List(heartRateData, id: \.uuid) { sample in
                        Text("\(sample.quantity.doubleValue(for: HKUnit.count().unitDivided(by: .minute()))) bpm")
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                    .onAppear {
                        addHeartDummyData()
                    }
                } else {
                    GmanSubTitl(subTitl: "Please grant access to HealthKit to see data.")
                        .padding()
                }
            }
        }
        .onAppear() {
            healthKitManager.requestAuthorization()
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
