//
//  ActualHeartRate.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

// MARK: - Actual Healthkit Data
/*
This file will be displayed on Actual data Tabbar
 - Here if authorized to access the health data heartRateData on appear using HealthKitManager() grabbing the actal data Line number 36,37 42,43
 - Similerly other data can be grabbed
*/

import SwiftUI
import HealthKit

struct ActualHeartRate: View {
    
    @StateObject var healthKitManager = HealthKitManager()
    @State private var heartRateData: [HKQuantitySample] = []
    @Binding var isLogOut: Bool
    
    var body: some View {
        ZStack {
            GmansBGView()
            VStack {
                HStack {
                    Text("")
                    Spacer()
                    GmanHeading(heading: "Health Data")
                        .padding()
                    Spacer()
                    GmanLogOutBtn(isLogOut: $isLogOut)
                }
                Spacer()
                if healthKitManager.isHeartRateAuthorized {
                    List(heartRateData, id: \.uuid) { sample in
                        Text("\(sample.quantity.doubleValue(for: HKUnit.count().unitDivided(by: .minute()))) bpm")
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                    .onAppear {
                        healthKitManager.fetchHeartRateData { samples, error in
                            if let samples = samples {
                                heartRateData = samples
                            } else if let error = error {
                                print("Error fetching heart rate data: \(error.localizedDescription)")
                            }
                        }
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
}

#Preview {
    ActualHeartRate(isLogOut: .constant(true))
}
