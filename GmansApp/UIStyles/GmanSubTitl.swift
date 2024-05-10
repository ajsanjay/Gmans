//
//  GmanSubTitl.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

// MARK: - Subtitle text
/*
 This file is used to Display the text content with the following configuration
*/

import SwiftUI

struct GmanSubTitl: View {
    
    let subTitl: String
    
    var body: some View {
        Text(subTitl)
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(.heading)
            .padding()
    }
}

#Preview {
    GmanSubTitl(subTitl: "This is sub title")
}
