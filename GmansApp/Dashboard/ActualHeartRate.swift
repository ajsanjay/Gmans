//
//  ActualHeartRate.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import SwiftUI
import HealthKit

struct ActualHeartRate: View {
    
    @StateObject var healthKitManager = HealthKitManager()
    @State private var heartRateData: [HKQuantitySample] = []
    
    var body: some View {
        ZStack {
            GmansBGView()
            VStack {
                GmanHeading(heading: "Health Data")
                    .padding()
                Spacer()
                if healthKitManager.isAuthorized {
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
    ActualHeartRate()
}
