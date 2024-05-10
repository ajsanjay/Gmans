//
//  GmanLogOutBtn.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 10/05/24.
//

import SwiftUI

struct GmanLogOutBtn: View {
    
    @Binding var isLogOut: Bool
    
    var body: some View {
        Button(action: {
            isLogOut.toggle()
        }) {
            Image(systemName: "power")
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(.red)
        }
        .padding()
    }
    
}

#Preview {
    GmanLogOutBtn(isLogOut: .constant(false))
}
