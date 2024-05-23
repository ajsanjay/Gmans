//
//  GmanButton.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

// MARK: - Button Style
/*
 This file manages the button body eg: Button action can be handled in the respective parent view this view can be re used for all buttons so that the buttons will look uniform
*/

import SwiftUI

struct GmanButton: View {
    
    let buttonTitle: String
    
    var body: some View {
        Text(buttonTitle)
            .font(.title2)
            .fontWeight(.medium)
            .foregroundColor(Color("buttonTitle"))
            .frame(width: 290, height: 60)
            .background(Color("buttonBg").gradient)
            .cornerRadius(30)
    }
    
}

#Preview {
    GmanButton(buttonTitle: "Click Me")
}
