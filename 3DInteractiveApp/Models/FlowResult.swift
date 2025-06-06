//
//  FlowResult.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import Foundation
import SwiftUICore

struct FlowResult {
    var bounds = CGSize.zero
    var frames: [CGRect] = []
    
    init(in maxWidth: CGFloat, subviews: LayoutSubviews) {
        var x: CGFloat = 0
        var y: CGFloat = 0
        var lineHeight: CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            
            if x + size.width > maxWidth {
                x = 0
                y += lineHeight + 10
                lineHeight = 0
            }
            
            frames.append(CGRect(x: x, y: y, width: size.width, height: size.height))
            
            x += size.width + 10
            lineHeight = max(lineHeight, size.height)
        }
        
        bounds = CGSize(width: maxWidth, height: y + lineHeight)
    }
}

