//
//  GmansSplashBG.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 03/05/24.
//

// MARK: - Splash Screen background
/*
 This file is the background of Splash screen
 - GmansBGView() is the background used in entire app
*/

import SwiftUI

struct GmansSplashBG: View {
        
    var body: some View {
        GmansBGView()
            .overlay(
                HeartView()
            )
    }
}

#Preview {
    GmansSplashBG()
}
