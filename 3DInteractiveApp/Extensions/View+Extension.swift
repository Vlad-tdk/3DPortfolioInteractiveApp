//
//  View+Extension.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUICore

extension View {
    func continuousRotation(angle: Double) -> some View {
        modifier(ContinuousRotationModifier(rotationAngle: angle))
    }
}
