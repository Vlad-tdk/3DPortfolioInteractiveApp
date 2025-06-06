//
//  ProjectsView.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUI

struct ProjectsView: View {
    @EnvironmentObject var portfolioService: PortfolioService
    @State private var selectedProject: Project?
    
    var body: some View {
        ZStack {
            AnimatedBackgroundView()
            
            if portfolioService.isLoading {
                LoadingView()
            } else {
                ScrollView {
                    VStack(spacing: 20) {
                        Text("Featured Projects")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 50)
                        
                        LazyVStack(spacing: 20) {
                            ForEach(portfolioService.projects) { project in
                                ProjectCard(project: project, selectedProject: $selectedProject)
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer(minLength: 100)
                    }
                }
            }
        }
        .sheet(item: $selectedProject) { project in
            ProjectDetailView(project: project)
        }
    }
}

