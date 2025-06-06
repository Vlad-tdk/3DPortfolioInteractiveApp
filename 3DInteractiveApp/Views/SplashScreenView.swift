//
//  SplashScreenView.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUI

struct SplashScreenView: View {
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0
    @State private var rotationAngle: Double = 0
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.purple, Color.blue, Color.cyan],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ZStack {
                    Circle()
                        .fill(LinearGradient(colors: [.white.opacity(0.2), .clear], startPoint: .top, endPoint: .bottom))
                        .frame(width: AppConstants.profileImageLargeSize, height: AppConstants.profileImageLargeSize)
                        .blur(radius: 2)
                    
                    Image(systemName: "swift")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundStyle(LinearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottom))
                        .continuousRotation(angle: rotationAngle)
                }
                .scaleEffect(scale)
                
                Text("Portfolio")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .opacity(opacity)
                
                Text("iOS Developer Showcase")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .opacity(opacity)
            }
        }
        .onAppear {
            withAnimation(.spring(response: 1.5, dampingFraction: 0.6)) {
                scale = 1.0
            }
            
            withAnimation(.easeIn(duration: 1).delay(0.5)) {
                opacity = 1.0
            }
            
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                rotationAngle = 360
            }
        }
    }
}
