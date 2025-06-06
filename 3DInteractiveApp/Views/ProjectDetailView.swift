//
//  ProjectDetailView.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUI

struct ProjectDetailView: View {
    let project: Project
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [.black, project.color.color.opacity(0.3)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    RoundedRectangle(cornerRadius: 150)
                        .fill(project.color.color.opacity(0.3))
                        .frame(width: 200, height: 200)
                        .overlay(
                            Image(systemName: "app.fill")
                                .font(.system(size: 80))
                                .foregroundColor(project.color.color)
                        )
                    
                    VStack(spacing: 15) {
                        HStack {
                            Text(project.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            if project.isCompleted {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.green)
                            }
                        }
                        
                        Text(project.description)
                            .font(.body)
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Technologies Used:")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        FlowLayout {
                            ForEach(project.technologies, id: \.self) { tech in
                                Text(tech)
                                    .font(.body)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(project.color.color.opacity(0.2))
                                    .foregroundColor(project.color.color)
                                    .cornerRadius(25)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    if let githubUrl = project.githubUrl, let url = URL(string: githubUrl) {
                        Button(action: {
                            UIApplication.shared.open(url)
                        }) {
                            HStack {
                                Image(systemName: "link")
                                Text("View on GitHub")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(project.color.color)
                            .cornerRadius(AppConstants.cardCornerRadius)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(project.color.color)
                }
            }
        }
    }
}

