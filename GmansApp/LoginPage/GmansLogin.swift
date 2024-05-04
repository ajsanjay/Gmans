//
//  GmansLogin.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import SwiftUI

struct GmansLogin: View {
    
    var body: some View {
        ZStack {
            GmansBGView()
            HStack {
                GmanHeading(heading: "Welcome user")
            }
        }
    }
    
}

#Preview {
    GmansLogin()
}
