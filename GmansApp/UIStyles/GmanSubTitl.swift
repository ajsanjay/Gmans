//
//  GmanSubTitl.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import SwiftUI

struct GmanSubTitl: View {
    
    let subTitl: String
    
    var body: some View {
        Text(subTitl)
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(.heading)
    }
}

#Preview {
    GmanSubTitl(subTitl: "This is sub title")
}
