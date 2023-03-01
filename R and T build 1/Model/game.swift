//
//  game.swift
//  R and T build 1
//
//  Created by Kazimir on 28.02.23.
//

import Foundation
protocol GameProtocol{
    var generateNumber:Int{get}
    var countRounds:Int{get}
    var score:Int{get}
    var isGameEnded: Bool { get }
    func startNewRound()
    func restartGame()
    func calculateScore(sliderNum:Int)
    
}
class Game:GameProtocol{
    var score: Int = 0
  private  var startGenerateNumber:Int
    private var endGenerateNumber:Int
    var generateNumber:Int = 0
    var countRounds:Int
    private var currentRound:Int = 1
    
    var isGameEnded: Bool {
            if currentRound >= countRounds {
                return true
            } else {
                return false
            }
        }
    
    
    init?(startGenNumber:Int, endGenNumber:Int, rounds:Int ) {
        guard startGenNumber <= endGenNumber else {return nil}
      startGenerateNumber = startGenNumber
      endGenerateNumber = endGenNumber
        countRounds = rounds
        generateNumber = self.getNewNumber()
        
        
    }
    func startNewRound(){
        generateNumber = self.getNewNumber()
        currentRound += 1
    }
    func restartGame(){
        score = 0
        currentRound = 0
        startNewRound()
        
    }
    private func getNewNumber()->Int{
        return Int.random(in: startGenerateNumber...endGenerateNumber)
        
    }
    func calculateScore(sliderNum:Int) {
        
        if sliderNum > generateNumber{
            score += 50 - (sliderNum - generateNumber)
        } else if sliderNum < generateNumber{
            score += 50 - (generateNumber - sliderNum)
        } else {
            score += 50
        }
    
    }
    
    
    
}
