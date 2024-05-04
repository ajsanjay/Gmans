//
//  GmanButton.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import SwiftUI

struct GmanButton: View {
    
    let buttonTitle: String
    
    var body: some View {
        Text(buttonTitle)
            .font(.title2)
            .fontWeight(.medium)
            .foregroundColor(.buttonTitle)
            .frame(width: 290, height: 60)
            .background(.buttonBg.gradient)
            .cornerRadius(30)
    }
    
}

#Preview {
    GmanButton(buttonTitle: "Click Me")
}
