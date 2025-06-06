//
//  HomeView.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var portfolioService: PortfolioService
    @StateObject private var particleSystem = ParticleSystem()
    @State private var showProfile = false
    @State private var rotationAngle: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Animated background
                AnimatedBackgroundView()
                
                // Particle system
                ForEach(particleSystem.particles) { particle in
                    Circle()
                        .fill(Color.cyan.opacity(0.6))
                        .frame(width: AppConstants.particleSize, height: AppConstants.particleSize)
                        .position(particle.position)
                        .blur(radius: 1)
                }
                
                if portfolioService.isLoading {
                    LoadingView()
                } else if let error = portfolioService.error {
                    ErrorView(error: error) {
                        Task {
                            await portfolioService.fetchPortfolioData()
                        }
                    }
                } else if let profile = portfolioService.profile {
                    ProfileContentView(profile: profile, showProfile: $showProfile, rotationAngle: $rotationAngle)
                }
            }
        }
        .onAppear {
            particleSystem.startParticleAnimation(in: UIScreen.main.bounds.size)
            
            withAnimation(.spring(response: 1, dampingFraction: 0.6)) {
                showProfile = true
            }
            
            withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                rotationAngle = 360
            }
        }
        .onDisappear {
            particleSystem.stopParticleAnimation()
        }
    }
}

