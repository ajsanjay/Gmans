//
//  DashBoard.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import SwiftUI

struct DashBoard: View {
    
    @Binding var isDisplayingDetail: Bool
    
    var body: some View {
        ZStack {
            GmansBGView()
            VStack {
                HStack {
                    Button(action: {
                        isDisplayingDetail = false
                    }) {
                        GmansNavButton(titleName: "arrow.backward")
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
}

#Preview {
    DashBoard(isDisplayingDetail: .constant(false))
}
