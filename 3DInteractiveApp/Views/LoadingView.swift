//
//  LoadingView.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUI

struct LoadingView: View {
    @State private var rotation: Double = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .stroke(Color.cyan.opacity(0.3), lineWidth: 4)
                .frame(width: 50, height: 50)
                .overlay(
                    Circle()
                        .trim(from: 0, to: 0.3)
                        .stroke(Color.cyan, lineWidth: 4)
                        .rotationEffect(.degrees(rotation))
                )
                .onAppear {
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                        rotation = 360
                    }
                }
            
            Text("Loading Portfolio...")
                .font(.headline)
                .foregroundColor(.white)
        }
    }
}

