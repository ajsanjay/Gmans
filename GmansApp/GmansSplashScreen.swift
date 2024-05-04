//
//  GmansSplashScreen.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 03/05/24.
//

import SwiftUI

struct GmansSplashScreen: View {
    
    @State var isLoadingDone: Bool = false
    
    var body: some View {
        ZStack {
            GmansSplashBG()
            VStack {
                ECGGraphView()
                ProgressBar(isLoadingDone: $isLoadingDone)
            }
        }
        .fullScreenCover(isPresented: $isLoadingDone, content: {
            GmansLogin()
        })
    }
}

struct ProgressBar: View {
    
    @State private var progressValue: CGFloat = 0.0
    @Binding var isLoadingDone: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 10)
                    .opacity(0.3)
                    .foregroundColor(Color.blue)
                    .cornerRadius(10)
                
                Rectangle()
                    .frame(width: min(self.progressValue * geometry.size.width, geometry.size.width), height: 10)
                    .foregroundColor(Color.green)
                    .cornerRadius(10)
                    .onAppear {
                        animateProgressBar()
                    }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: 10)
        .padding()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                if self.progressValue >= 100 {
                    timer.invalidate()
                } else {
                    self.progressValue += 1
                }
            }
        }
    }
    
    private func animateProgressBar() {
        withAnimation(.linear(duration: 5)) {
            progressValue = 100
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                isLoadingDone = true
            }
        }
    }
}


#Preview {
    GmansSplashScreen()
}

struct ECGGraphView: View {
    
    @State var trimEnd: CGFloat = 0
    
    let dataPoints: [CGFloat] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.0, 0.0, -0.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    
    var body: some View {
        VStack {
            Text("")
                .padding()
            Text("")
                .padding()
            
            Spacer()
            
            HStack {
                Path { path in
                    let stepX = UIScreen.main.bounds.width / CGFloat(dataPoints.count - 1)
                    let stepY = 150
                    var x: CGFloat = 0
                    
                    path.move(to: CGPoint(x: x, y: CGFloat(stepY) * dataPoints[0]))
                    
                    for point in dataPoints.dropFirst() {
                        x += stepX
                        path.addLine(to: CGPoint(x: x, y: CGFloat(stepY) * point))
                    }
                }
                .trim(from: 0, to: trimEnd)
                .stroke(Color.blue, lineWidth: 2)
            }
            .onAppear {
                startAnimating()
            }
            
            Spacer()
        }
    }
    
    private func startAnimating() {
        withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
            self.trimEnd = 1
        }
    }
}


