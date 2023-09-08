//
//  GenericButton.swift
//  Memory Genius
//
//  Created by Lucas Migge on 08/09/23.
//

import SwiftUI

struct GenericButton: View {
    enum Style {
        case power, play
    }
    
    var style: Style
    var isActive: Bool
    var onTap: () -> Void
    
    var label: String {
        switch style {
        case .power:
            return "Power"
        case .play:
            return "Play"
        }
    }
    
    var body: some View {
        Text(label)
            .font(.largeTitle)
            .padding(20)
            .background {
                if isActive {
                    Color.accentColor
                } else {
                    Color.gray
                }
            }
            .cornerRadius(100)
            .shadow(color: isActive ? .accentColor : .black,
                    radius: isActive ? 10 : 5)
            .onTapGesture {
                onTap()
            }
        
    }
}



struct GenericButton_Previews: PreviewProvider {
    
    static var previews: some View {
        GenericButton(style: .power, isActive: true) {
            // button action
        }
    }
}
