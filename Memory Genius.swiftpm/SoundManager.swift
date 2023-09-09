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
    
    private func getSoundRelatedToColor(color: GameMove) -> FXSounds {
        switch color {

        case .blue:
            return .pickupCoin1
        case .green:
            return .pickupCoin2
        case .red:
            return .pickupCoin3
        case .yellow:
            return .pickupCoin4
        }
    }
    
    public func playGameOverSound() {
        
        guard let url = Bundle.main.url(forResource: FXSounds.explosion.rawValue, withExtension: "wav") else {
            return
        }
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
        } catch let error {
            print("Erro ao reproduzir fx: \(error.localizedDescription)")
        }
    }
    
    public func playFXSound(color: GameMove) {
        soundPlayer = nil
        
        let soundOfButton: FXSounds = getSoundRelatedToColor(color: color)
        
        guard let soundURL = getSoundURL(sound: soundOfButton) else {
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
    
    public func playFXSound(_ sound: FXSounds) {
        soundPlayer = nil
        
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

enum FXSounds: String, CaseIterable {
    case pickupCoin1, pickupCoin2, pickupCoin3, pickupCoin4, explosion, gameStart, bip
    
}
