//
//  GmanHeading.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

// MARK: - Heading Text
/*
 This is a heading style used in entire app
 */

import SwiftUI

struct GmanHeading: View {
    
    let heading: String
    
    var body: some View {
        Text(heading)
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundColor(.heading)
    }
}

#Preview {
    GmanHeading(heading: "Heading")
}
