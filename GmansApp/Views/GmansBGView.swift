//
//  GmansBGView.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

// MARK: - Background
/*
 This file is the background for entire app
*/

import SwiftUI

struct GmansBGView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("BgTop"), Color("BgBottom")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    GmansBGView()
}
