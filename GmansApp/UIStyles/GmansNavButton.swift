//
//  GmansNavButton.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import SwiftUI

struct GmansNavButton: View {
    
    let titleName: String
    
    var body: some View {
        Image(systemName: titleName)
            .resizable()
            .frame(width: 40, height: 30)
            .foregroundColor(.heading)
            .padding()
    }
    
}

#Preview {
    GmansNavButton(titleName: "arrow.backward")
}
