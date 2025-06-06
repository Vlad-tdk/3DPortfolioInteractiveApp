//
//  PortfolioService.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import Foundation

// MARK: - Services
@MainActor
class PortfolioService: ObservableObject {
    @Published var profile: UserProfile?
    @Published var skills: [Skill] = []
    @Published var projects: [Project] = []
    @Published var isLoading = false
    @Published var error: String?
    
    private let networkDelay: UInt64 = 2_000_000_000 // 2 seconds
    
    func fetchPortfolioData() async {
        isLoading = true
        error = nil
        
        do {
            // Simulate network calls
            async let profileTask = fetchProfile()
            async let skillsTask = fetchSkills()
            async let projectsTask = fetchProjects()
            
            let (fetchedProfile, fetchedSkills, fetchedProjects) = try await (profileTask, skillsTask, projectsTask)
            
            profile = fetchedProfile
            skills = fetchedSkills
            projects = fetchedProjects
        } catch {
            self.error = "Failed to load portfolio data: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    private func fetchProfile() async throws -> UserProfile {
        try await Task.sleep(nanoseconds: networkDelay)
        return UserProfile(
            name: "Vladimir Martemianov",
            title: "iOS Developer",
            bio: "Passionate about creating beautiful and functional iOS applications with modern Swift technologies",
            email: "tdk@null.net",
            phone: "on request",
            linkedin: "www.linkedin.com/in/vladimir-m-6b12072bb/",
            github: "github.com/Vlad-tdk",
            yearsExperience: "3",
            projectsCount: "4",
            technologiesCount: 7
        )
    }
    
    private func fetchSkills() async throws -> [Skill] {
        try await Task.sleep(nanoseconds: networkDelay / 2)
        return [
            Skill(name: "SwiftUI", level: 0.9, color: .blue),
            Skill(name: "UIKit", level: 0.95, color: .green),
            Skill(name: "Core Data", level: 0.8, color: .orange),
            Skill(name: "Combine", level: 0.75, color: .purple),
            Skill(name: "ARKit", level: 0.7, color: .red),
            Skill(name: "CloudKit", level: 0.65, color: .cyan),
            Skill(name: "MLCore", level: 0.45, color: .indigo),
            Skill(name: "Swift Package Manager", level: 0.95, color: .green),
            Skill(name: "Metal", level: 0.2, color: .red)
        ]
    }
    
    private func fetchProjects() async throws -> [Project] {
        try await Task.sleep(nanoseconds: networkDelay / 3)
        return [
            Project(
                name: "Weather App",
                description: "Beautiful weather app with custom animations and Core Location integration",
                technologies: ["UIKit", "Core Location", "WeatherKit"],
                color: .blue,
                githubUrl: "https://github.com/Vlad-tdk/WeatherPro",
                isCompleted: true
            ),
            Project(
                name: "Task Master",
                description: "Productivity app with Core Data persistence and widget support",
                technologies: ["SwiftUI", "Core Data", "WidgetKit"],
                color: .green,
                githubUrl: "https://github.com/Vlad-tdk/TaskMasterApp.git",
                isCompleted: false
            ),
            Project(
                name: "AR Visualizer",
                description: "Augmented reality app for 3D model visualization",
                technologies: ["ARKit", "SceneKit", "RealityKit"],
                color: .purple,
                githubUrl: "https://github.com/Vlad-tdk/ARVisualizerApp.git",
                isCompleted: false
            ),
            Project(
                name: "Swift Concurrency",
                description: "Structured Concurrency, Cooperative Cancellation, Safe Data Access",
                technologies: ["SwiftUI", "Core Swift Concurrency", "Combine"],
                color: .orange,
                githubUrl: "https://github.com/Vlad-tdk/SwiftConcurrency.git",
                isCompleted: true
            ),
            Project(
                name: "Artwork App",
                description: "ArtworkApp is a demonstration iOS application that displays a gallery of artworks with animated transitions, asynchronously generated placeholder images, and runtime method injection using Objective-C.",
                technologies: ["Objective-C"],
                color: .cyan,
                githubUrl: "https://github.com/Vlad-tdk/ArtworkApp.git",
                isCompleted: true
            ),
        ]
    }
}
