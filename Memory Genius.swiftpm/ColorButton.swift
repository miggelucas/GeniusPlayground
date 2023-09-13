//
//  ColorButton.swift
//  Memory Genius
//
//  Created by Lucas Migge on 12/09/23.
//

import SwiftUI

struct ColorButton: View {
    
    var move: GameMove
    
    var colorButton: Color {
        switch move {
        case .blue:
            return .blue
        case .green:
            return .green
        case .red:
            return .red
        case .yellow:
            return .yellow  
        }
    }
    
    @Binding var shouldGlow: Bool
    
    var body: some View {
        if shouldGlow {
            Circle()
                .foregroundColor(colorButton)
                .shadow(color: colorButton, radius: 8)
                .padding()
                .frame(width: 100, height: 100)
        } else {
            Circle()
                .stroke(lineWidth: 4)
                .foregroundColor(colorButton)
                .padding()
                .frame(width: 100, height: 100)
        }
        
        
    }
}

struct ColorButton_Previews: PreviewProvider {
    static var previews: some View {
        ColorButton(move: .blue, shouldGlow: .constant(false))
    }
}
