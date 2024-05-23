//
//  GmansNavButton.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

// MARK: - Navigation button
/*
 This file is used to Display the navigation bar button item
*/

import SwiftUI

struct GmansNavButton: View {
    
    let titleName: String
    
    var body: some View {
        Image(systemName: titleName)
            .resizable()
            .frame(width: 40, height: 30)
            .foregroundColor(Color("heading"))
            .padding()
    }
    
}

#Preview {
    GmansNavButton(titleName: "arrow.backward")
}
