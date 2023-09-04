//
//  MainViewModel.swift
//  Meu App
//
//  Created by Lucas Migge on 03/09/23.
//

import Foundation
import SwiftUI


class MainViewModel: ObservableObject {
    
    private var audioManager = AudioManager()
    
    enum State {
        case off, playing, waitingUserResponse
    }
    
    @Published var state: State = .off
    
    @Published var isGreenActive: Bool = false
    @Published var isRedActive: Bool = false
    @Published var isBlueActive: Bool = false
    @Published var isYellowActive: Bool = false
    
    private var gameMoves: [GameMove] = []
    private var userMoves: [GameMove] = []
    
    
    public func greenButtonPressed() {
        if state == .waitingUserResponse  {
            checkplay(move: .green)
            glowButton(move: .green)
        }
    }
    
    public func redButtonPressed() {
        if state == .waitingUserResponse  {
            checkplay(move: .red)
            glowButton(move: .red)
            
        }
        
    }
    
    public func blueButtonPressed() {
        if state == .waitingUserResponse  {
            checkplay(move: .blue)
            glowButton(move: .blue)
            
        }
        
        
    }
    
    public func yellowButtonPressed() {
        if state == .waitingUserResponse  {
            checkplay(move: .yellow)
            glowButton(move: .yellow)
            
        }
    }
    
    public func startGame() {
        userMoves = []
        gameMoves = []
        
        state = .playing
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.nextRound()
        }
        
        
        
    }
    
    private func checkplay(move: GameMove) {
        
        userMoves.append(move)
        
        var checkIndex: Int = 0
        
        for (index, element) in userMoves.enumerated() {
            if element != gameMoves[index] {
                gameOver()
                return
            } else {
                audioManager.playeFXSound(color: move)
                checkIndex += 1
            }
        }
        
        if checkIndex == gameMoves.count {
            self.state = .playing
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                self.nextRound()
                
            }
            
        }
        
    }
    
    
    private func gameOver() {
        state = .off
        userMoves = []
        gameMoves = []
        audioManager.playGameOverSound()
        print("Errou otaru")
        
    }
    
    private func nextRound() {
        userMoves = []
        gameMoves.append(GameMove.allCases.randomElement()!)
        
        for (index, element) in gameMoves.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 1.1) { [weak self] in
                self?.glowButton(move: element)
                self?.audioManager.playeFXSound(color: element)
                
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
