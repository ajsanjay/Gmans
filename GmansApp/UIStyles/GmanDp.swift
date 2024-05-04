//
//  GmanDp.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import SwiftUI

struct GmanDp: View {
    
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .frame(width: 150, height: 150)
            .foregroundColor(.heading)
    }
    
}

#Preview {
    GmanDp(systemName: "person.circle")
}
