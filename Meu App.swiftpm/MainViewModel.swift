//
//  MainViewModel.swift
//  Meu App
//
//  Created by Lucas Migge on 03/09/23.
//

import Foundation


class MainViewModel: ObservableObject {
    
    var audioManager = AudioManager()
    
    @Published var isGreenActive: Bool = false
    @Published var isRedActive: Bool = false
    @Published var isBlueActive: Bool = false
    @Published var isYellowActive: Bool = false
    
    
    public func greenButtonPressed() {
        audioManager.playeFXSound(sound: .pickupCoin1)
        
    }
    
    public func redButtonPressed() {
        audioManager.playeFXSound(sound: .pickupCoin2)
        
    }
    
    public func blueButtonPressed() {
        audioManager.playeFXSound(sound: .pickupCoin3)
        
        
    }
    
    public func yellowButtonPressed() {
        audioManager.playeFXSound(sound: .pickupCoin4)
    }
}
