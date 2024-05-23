//
//  GmanDp.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

// MARK: - Dp Style
/*
 This file manages the Dp icon As if now this is used for dp this can be used for loading any system image with 150 * 150 ratio
*/

import SwiftUI

struct GmanDp: View {
    
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .frame(width: 150, height: 150)
            .foregroundColor(Color("heading"))
    }
    
}

#Preview {
    GmanDp(systemName: "person.circle")
}
