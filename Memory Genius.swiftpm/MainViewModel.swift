//
//  MainViewModel.swift
//  Meu App
//
//  Created by Lucas Migge on 03/09/23.
//

import Foundation
import SwiftUI


enum GameMode: String, CaseIterable {
    case easy, medium, hard, extreme
}

class MainViewModel: ObservableObject {
    
    private var audioManager: AudioManager?
    
    enum State {
        case idle, playing, waitingUserResponse
    }
    
    @Published var state: State = .idle
    @Published var score: Int = 0
    
    var isOn: Bool {
        state != .idle
    }
    
    
    @Published var isGreenActive: Bool = false
    @Published var isRedActive: Bool = false
    @Published var isBlueActive: Bool = false
    @Published var isYellowActive: Bool = false
    
    @Published var mode: GameMode = .easy
    
    public var avaibleMoves: [GameMove] {
        switch mode {
        case .easy:
            return [.blue, .red, .green]
        case .medium:
            return [.blue, .red, .green, .yellow]
        case .hard:
            return [.blue, .red, .green, .yellow, .red]
        case .extreme:
            return [.blue, .red, .green, .yellow, .red, .blue]
        }
    }
    
    private var gameMoves: [GameMove] = []
    private var userMoves: [GameMove] = []
    
    public func ColorButtonPressed(move: GameMove) {
        if state == .waitingUserResponse {
            checkplay(move: move)
            glowButton(move: move)
        }
    }
    
    public func powerButtonPressed() {
        
    }
    
    public func startGame() {
        resetGameState()
        state = .playing
        audioManager?.playFXSound(.bip)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.nextRound()
        }
        
        
    }
    
    private func checkplay(move: GameMove) {
        userMoves.append(move)
        
        let checkIndex: Int = userMoves.count - 1
        
        if userMoves.last! == gameMoves[checkIndex] {
            audioManager?.playFXSound(color: move)
            
        } else {
            gameOver()
            return
        }
        
        
        if userMoves.count == gameMoves.count {
            self.state = .playing
            self.score += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.nextRound()
                
            }
            
        }
        
    }
    
    private func resetGameState() {
        userMoves = []
        gameMoves = []
        score = 0
        state = .idle
    }
    
    private func gameOver() {
        
        resetGameState()
        audioManager?.playGameOverSound()
        print("Errou otaru")
        
    }
    
    private func playMove(for move: GameMove) {
        if isOn {
            glowButton(move: move)
            audioManager?.playFXSound(color: move)
            
        }
    }
    
    private func nextRound() {
        userMoves = []
        gameMoves.append(avaibleMoves.randomElement()!)
        
        for (index, element) in gameMoves.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 1.1) { [weak self] in
                
                self?.playMove(for: element)
                
                if index == (self?.gameMoves.count)! - 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 1.0) { [weak self] in
                        self?.state = .waitingUserResponse
                    }
                }
            }
        }
        
    }
    
    private func glowButton(move: GameMove) {
        switch move {
        case .blue:
            isBlueActive = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                self.isBlueActive = false
            }
        case .green:
            isGreenActive = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                self.isGreenActive = false
            }
            
        case .red:
            isRedActive = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                self.isRedActive = false
            }
        case .yellow:
            isYellowActive = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isYellowActive = false
            }
        }
        
    }
}

enum GameMove: CaseIterable {
    case blue, green, red, yellow
}
