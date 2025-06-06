//
//  StatCard.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUI

struct StatCard: View {
    let number: String
    let title: String
    let icon: String
    @State private var show = false
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.cyan)
            
            Text(number)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: AppConstants.cardCornerRadius)
                .fill(.ultraThinMaterial)
                .opacity(0.8)
        )
        .scaleEffect(show ? 1 : 0.5)
        .onAppear {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.6).delay(Double.random(in: 0...0.5))) {
                show = true
            }
        }
    }
}

