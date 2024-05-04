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
            VStack (spacing: 30) {
                GmanHeading(heading: "Welcome user")
                    .padding(.bottom, 40)
                GmanDp(systemName: "person.circle")
                    .padding(.bottom, 30)
                Button(action: {
                    
                }) {
                    GmanButton(buttonTitle: "Sign In With Apple")
                }
                Button(action: {
                    
                }) {
                    GmanButton(buttonTitle: "Enter User")
                }
            }
        }
    }
    
}

#Preview {
    GmansLogin()
}
