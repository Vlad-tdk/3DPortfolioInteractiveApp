//
//  MainAppView.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUI

struct MainAppView: View {
    @Binding var selectedTab: Int
    @EnvironmentObject var portfolioService: PortfolioService
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            SkillsView()
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    Text("Skills")
                }
                .tag(1)
            
            ProjectsView()
                .tabItem {
                    Image(systemName: "folder.fill")
                    Text("Projects")
                }
                .tag(2)
            
            ContactView()
                .tabItem {
                    Image(systemName: "envelope.fill")
                    Text("Contact")
                }
                .tag(3)
        }
        .accentColor(.cyan)
        .task {
            if portfolioService.profile == nil {
                await portfolioService.fetchPortfolioData()
            }
        }
    }
}

