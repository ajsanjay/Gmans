//
//  DashBoard.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import SwiftUI

struct DashBoard: View {
    
    @Binding var isDisplayingDetail: Bool
    @State private var selection = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                ZStack {
                    ActualHeartRate()
                }
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
                .tag(0)
                ZStack {
                    HardCodeHeathData()
                }
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
                .tag(1)
            }
            .tint(.tabbarSelection)
        }
        .onAppear() {
            UITabBar.appearance().unselectedItemTintColor = .tabbarDeSelect
        }
    }
}

#Preview {
    DashBoard(isDisplayingDetail: .constant(false))
}
