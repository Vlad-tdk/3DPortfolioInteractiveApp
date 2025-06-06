//
//  ContentView.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 5. 6. 2025..
//

import SwiftUI
import SceneKit

// MARK: - Main Views
struct ContentView: View {
    @StateObject private var portfolioService = PortfolioService()
    @State private var selectedTab = 0
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            if showSplash {
                SplashScreenView()
                    .transition(.opacity)
                    .onAppear {
                        Task {
                            try? await Task.sleep(nanoseconds: UInt64(AppConstants.splashDuration * 1_000_000_000))
                            withAnimation(.easeInOut(duration: AppConstants.animationDuration)) {
                                showSplash = false
                            }
                        }
                    }
            } else {
                MainAppView(selectedTab: $selectedTab)
                    .environmentObject(portfolioService)
            }
        }
        .preferredColorScheme(.dark)
        .task {
            if !showSplash {
                await portfolioService.fetchPortfolioData()
            }
        }
    }
}
