//
//  GmansBGView.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import SwiftUI

struct GmansBGView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.bgTop, .bgBottom]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    GmansBGView()
}
