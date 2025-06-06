//
//  UserProfile.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import Foundation

struct UserProfile: Codable {
    let name: String
    let title: String
    let bio: String
    let email: String
    let phone: String
    let linkedin: String
    let github: String
    let yearsExperience: String
    let projectsCount: String
    let technologiesCount: Int
}
