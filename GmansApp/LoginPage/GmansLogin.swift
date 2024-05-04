//
//  GmansLogin.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import SwiftUI

struct GmansLogin: View {
    
    @StateObject var viewModel = LoginViewModel()
    
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
                    viewModel.isEnterUser = true
                }) {
                    GmanButton(buttonTitle: "Enter User")
                }
            }
        }
        .fullScreenCover(isPresented: $viewModel.isEnterUser, content: {
            DashBoard(isDisplayingDetail: $viewModel.isEnterUser)
        })
    }
    
}

#Preview {
    GmansLogin()
}
