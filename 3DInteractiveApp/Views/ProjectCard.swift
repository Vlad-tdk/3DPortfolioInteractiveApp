//
//  ProjectCard.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUI

struct ProjectCard: View {
    let project: Project
    @Binding var selectedProject: Project?
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            selectedProject = project
        }) {
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(project.name)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            if project.isCompleted {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            } else {
                                Image(systemName: "clock.fill")
                                    .foregroundColor(.orange)
                            }
                        }
                        
                        Text(project.description)
                            .font(.body)
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.leading)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "arrow.up.right")
                        .font(.title2)
                        .foregroundColor(project.color.color)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(project.technologies, id: \.self) { tech in
                            Text(tech)
                                .font(.caption)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(project.color.color.opacity(0.2))
                                .foregroundColor(project.color.color)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal, 1)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: AppConstants.cardCornerRadius)
                    .fill(.ultraThinMaterial)
                    .opacity(isPressed ? 1.0 : 0.8)
            )
            .scaleEffect(isPressed ? 0.95 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        }, perform: {})
    }
}


