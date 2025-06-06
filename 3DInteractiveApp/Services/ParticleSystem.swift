//
//  ParticleSystem.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import Foundation

@MainActor
class ParticleSystem: ObservableObject {
    @Published var particles: [Particle] = []
    private var animationTask: Task<Void, Never>?
    
    func startParticleAnimation(in bounds: CGSize) {
        createParticles(in: bounds)
        
        animationTask = Task {
            while !Task.isCancelled {
                updateParticles(in: bounds)
                try? await Task.sleep(nanoseconds: 16_666_666) // ~60 FPS
            }
        }
    }
    
    func stopParticleAnimation() {
        animationTask?.cancel()
        animationTask = nil
    }
    
    private func createParticles(in bounds: CGSize) {
        particles = (0..<20).map { _ in
            Particle(
                position: CGPoint(
                    x: CGFloat.random(in: 0...bounds.width),
                    y: CGFloat.random(in: 0...bounds.height)
                ),
                velocity: CGPoint(
                    x: CGFloat.random(in: -1...1),
                    y: CGFloat.random(in: -1...1)
                )
            )
        }
    }
    
    private func updateParticles(in bounds: CGSize) {
        for i in particles.indices {
            particles[i].position.x += particles[i].velocity.x
            particles[i].position.y += particles[i].velocity.y
            
            // Bounce off edges
            if particles[i].position.x < 0 || particles[i].position.x > bounds.width {
                particles[i].velocity.x *= -1
            }
            if particles[i].position.y < 0 || particles[i].position.y > bounds.height {
                particles[i].velocity.y *= -1
            }
        }
    }
}
