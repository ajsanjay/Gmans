//
//  GmansLogin.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 04/05/24.
//

import SwiftUI
import AuthenticationServices

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
                SignInWithAppleButton(
                            onRequest: { request in
                                request.requestedScopes = [.fullName, .email]
                            },
                            onCompletion: { result in
                                switch result {
                                case .success(let authResults):
                                    handleAuthorizationResults(authResults)
                                case .failure(let error):
                                    print("Sign in with Apple failed: \(error)")
                                }
                            }
                        )
                        .frame(width: 290, height: 60)
                        .cornerRadius(30)
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
    
    func handleAuthorizationResults(_ authResults: ASAuthorization) {
        if let appleIDCredential = authResults.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            // You can also access user's full name, email, etc.
            print("User identifier \(userIdentifier)")
        }
    }
    
}

#Preview {
    GmansLogin()
}
