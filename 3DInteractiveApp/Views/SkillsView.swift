//
//  SkillsView.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUI

struct SkillsView: View {
    @EnvironmentObject var portfolioService: PortfolioService
    @State private var animateSkills = false
    
    var body: some View {
        ZStack {
            AnimatedBackgroundView()
            
            if portfolioService.isLoading {
                LoadingView()
            } else {
                ScrollView {
                    VStack(spacing: 30) {
                        Text("Technical Skills")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 50)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 20) {
                            ForEach(Array(portfolioService.skills.enumerated()), id: \.offset) { index, skill in
                                SkillCard(skill: skill, animateSkills: $animateSkills)
                                    .animation(.spring(response: 0.8, dampingFraction: 0.6).delay(Double(index) * 0.1), value: animateSkills)
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer(minLength: 100)
                    }
                }
            }
        }
        .onAppear {
            withAnimation {
                animateSkills = true
            }
        }
    }
}

