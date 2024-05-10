//
//  GmansSplashScreen.swift
//  GmansApp
//
//  Created by Jaya Sabeen on 03/05/24.
//

// MARK: - Splash Screen
/*
 Once App Enter the Launching state this screen will be loaded initially
 - In swift UI we do not have AppDeligate but we can add AppDeligate in main file which have the WindowGroup
 - ECGGraphView() is used to display an animation which displays the ECG graph style
*/

import SwiftUI

struct GmansSplashScreen: View {
    
    @State var isLoadingDone: Bool = false
    
    var body: some View {
        ZStack {
            GmansSplashBG()
            VStack {
                GmanHeading(heading: "Gmans Health")
                    .padding()
                ECGGraphView()
                    .offset(y: UIScreen.main.bounds.height * 0.4)
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
                    .foregroundColor(.chartFill)
                    .cornerRadius(5)
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
                    let stepY = UIScreen.main.bounds.height * 0.3
                    var x: CGFloat = 0
                    
                    path.move(to: CGPoint(x: x, y: CGFloat(stepY) * dataPoints[0]))
                    
                    for point in dataPoints.dropFirst() {
                        x += stepX
                        path.addLine(to: CGPoint(x: x, y: CGFloat(stepY) * point))
                    }
                }
                .trim(from: 0, to: trimEnd)
                .stroke(.chartLine, lineWidth: 2)
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


