//
//  SkillCard.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUI

struct SkillCard: View {
    let skill: Skill
    @Binding var animateSkills: Bool
    
    var body: some View {
        VStack(spacing: 15) {
            Text(skill.name)
                .font(.headline)
                .foregroundColor(.white)
            
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.2), lineWidth: 8)
                    .frame(width: AppConstants.skillCircleSize, height: AppConstants.skillCircleSize)
                
                Circle()
                    .trim(from: 0, to: animateSkills ? skill.level : 0)
                    .stroke(
                        LinearGradient(colors: [skill.color.color, skill.color.color.opacity(0.5)], startPoint: .top, endPoint: .bottom),
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .frame(width: AppConstants.skillCircleSize, height: AppConstants.skillCircleSize)
                    .rotationEffect(.degrees(-90))
                
                Text("\(Int(skill.level * 100))%")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: AppConstants.cardCornerRadius)
                .fill(.ultraThinMaterial)
                .opacity(0.8)
        )
    }
}


