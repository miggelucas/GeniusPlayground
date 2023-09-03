//
//  SoundManager.swift
//  Meu App
//
//  Created by Lucas Migge on 03/09/23.
//

import Foundation
import AVFoundation

class AudioManager {
    
    var soundPlayer: AVAudioPlayer?
    
    private func getSoundURL(sound: FXSounds) -> URL? {
        return Bundle.main.url(forResource: sound.rawValue, withExtension: "wav")
    }
    
    public func playeFXSound(sound: FXSounds) {
        
        guard let soundURL = getSoundURL(sound: sound) else {
            print("url não encontrado")
            return
        }
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: soundURL)
            soundPlayer?.play()
        } catch let error {
            print("Erro ao reproduzir fx: \(error.localizedDescription)")
        }

        
        
    }
    
}

enum FXSounds: String {
    case pickupCoin1, pickupCoin2, pickupCoin3, pickupCoin4
    
}
