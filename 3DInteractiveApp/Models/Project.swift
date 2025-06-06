//
//  Project.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import Foundation

struct Project: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    let technologies: [String]
    let color: Skill.SkillColor
    let githubUrl: String?
    let isCompleted: Bool
}
