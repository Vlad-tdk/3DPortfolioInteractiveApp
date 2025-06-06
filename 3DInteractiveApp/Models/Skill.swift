//
//  Skill.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import Foundation
import SwiftUICore

struct Skill: Identifiable, Codable {
    var id = UUID()
    let name: String
    let level: Double
    let color: SkillColor
    
    enum SkillColor: String, CaseIterable, Codable {
        case blue, green, orange, purple, red, cyan, indigo
        
        var color: Color {
            switch self {
            case .blue: return .blue
            case .green: return .green
            case .orange: return .orange
            case .purple: return .purple
            case .red: return .red
            case .cyan: return .cyan
            case .indigo: return .indigo
            }
        }
    }
}
