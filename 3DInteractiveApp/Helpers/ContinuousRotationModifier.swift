//
//  ContinuousRotationModifier.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import Foundation
import SwiftUI

// MARK: - Animation Helpers
struct ContinuousRotationModifier: ViewModifier, Animatable {
    var rotationAngle: Double
    
    var animatableData: Double {
        get { rotationAngle }
        set { rotationAngle = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(rotationAngle))
    }
}
