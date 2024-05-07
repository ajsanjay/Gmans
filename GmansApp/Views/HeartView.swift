//
//  HeartView.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 07/05/24.
//

import SwiftUI

struct HeartView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 20, height: 20, alignment: .center)
                .foregroundColor(.red)
                .cornerRadius(5)
            
            Circle()
                .frame(width: 20, height: 20, alignment: .center)
                .foregroundColor(.red)
                .padding(.top, -20)
            
            Circle()
                .frame(width: 20, height: 20, alignment: .center)
                .foregroundColor(.red)
                .padding(.trailing, -20)
        }
        .rotationEffect(Angle(degrees: -45))
    }
}

#Preview {
    HeartView()
}
