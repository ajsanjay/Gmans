//
//  DashBoard.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

// MARK: - Dashboard
/*
 A tabbar is used to toggle between the Actual data and Hardcode Data
 - The actual data functionality will display the hert rate once authorized to access health data
*/

import SwiftUI

struct DashBoard: View {
    
    @Binding var isDisplayingDetail: Bool
    @State private var selection = 0
    
    init(isDisplayingDetail: Binding<Bool>) {
        _isDisplayingDetail = isDisplayingDetail
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], for: .selected)
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                ZStack {
                    ActualHeartRate(isLogOut: $isDisplayingDetail)
                }
                .tabItem {
                    Image(systemName: "lock.laptopcomputer")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Text("Actual Data")
                }
                .tag(0)
                ZStack {
                    HardCodeHeathData(isLogOut: $isDisplayingDetail)
                }
                .tabItem {
                    Image(systemName: "lock.open.laptopcomputer")
                    Text("Hard Code")
                }
                .tag(1)
            }
            .tint(.white)
        }
        .onAppear() {
            UITabBar.appearance().unselectedItemTintColor = UIColor(named: "TabbarDeSelect")
            UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 10)
//            UITabBar.appearance().backgroundColor = .bgMid
        }
    }
}

#Preview {
    DashBoard(isDisplayingDetail: .constant(false))
}
