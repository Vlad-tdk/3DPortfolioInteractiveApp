//
//  ProfileContentView.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUI

struct ProfileContentView: View {
    let profile: UserProfile
    @Binding var showProfile: Bool
    @Binding var rotationAngle: Double
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                // Profile section
                VStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .fill(LinearGradient(
                                colors: [.purple, .blue, .cyan],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(width: AppConstants.profileImageLargeSize, height: AppConstants.profileImageLargeSize)
                            .blur(radius: 3)
                        
                        Circle()
                            .fill(Color.black.opacity(0.8))
                            .frame(width: AppConstants.profileImageSize, height: AppConstants.profileImageSize)
                        
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                    }
                    .scaleEffect(showProfile ? 1 : 0.5)
                    .continuousRotation(angle: rotationAngle)
                    
                    VStack(spacing: 8) {
                        Text(profile.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(profile.title)
                            .font(.title2)
                            .foregroundColor(.cyan)
                            .fontWeight(.medium)
                        
                        Text(profile.bio)
                            .font(.body)
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
                .padding(.top, 50)
                
                // Stats section
                HStack(spacing: 30) {
                    StatCard(number: "\(profile.yearsExperience)+", title: "Years", icon: "calendar")
                    StatCard(number: "\(profile.projectsCount)+", title: "Projects", icon: "folder")
                    StatCard(number: "\(profile.technologiesCount)+", title: "Technologies", icon: "gear")
                }
                
                // Interactive 3D Scene
                Interactive3DView()
                    .frame(height: 300)
                    .cornerRadius(20)
                    .padding(.horizontal)
                
                Spacer(minLength: 100)
            }
        }
    }
}
