//
//  TrapezoidShape.swift
//  Memory Genius
//
//  Created by Lucas Migge on 04/09/23.
//

import Foundation
import SwiftUI


struct TrapezoidShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let startPoint = CGPoint(x: rect.midX - 50, y: rect.minY)
        let topRightPoint = CGPoint(x: rect.midX + 50, y: rect.minY)
        let bottomRightPoint = CGPoint(x: rect.maxX, y: rect.maxY)
        let bottomLeftPoint = CGPoint(x: rect.minX, y: rect.maxY)

        path.move(to: startPoint)
        path.addLine(to: topRightPoint)
        path.addLine(to: bottomRightPoint)
        path.addLine(to: bottomLeftPoint)
        path.closeSubpath()

        return path
    }
}
