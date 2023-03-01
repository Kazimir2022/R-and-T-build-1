//
//  ViewController.swift
//  R and T build 1
//
//  Created by Kazimir on 28.02.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label:UILabel!
    @IBOutlet var slider:UISlider!
    var game:Game!
    // MARK: - Жизненный цикл

    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(startGenNumber: 1, endGenNumber: 50, rounds: 5)
        updateLabel(newText: String(game.generateNumber))
    }
    
    
    
    // MARK: - Взаимодействие View - Model
    
    
    
    @IBAction func checkResult() {
        game.calculateScore(sliderNum: Int(slider.value))
        
                // Проверяем, окончена ли игра
                if game.isGameEnded {
                    showAlertWith(score: game.score)
                    // Рестартуем игру
                    game.restartGame()
                } else {
                    game.startNewRound()
                }
                // Обновляем данные о текущем значении загаданного числа
        updateLabel(newText: String(game.generateNumber))
        
        
    }
        
    // MARK: - Обновление View
        private func updateLabel(newText: String){
            label.text = String(newText)
        }
        
        
    private func showAlertWith( score: Int ) {
            let alert = UIAlertController(
                            title: "Игра окончена",
                            message: "Вы заработали \(score) очков",
                            preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
   
}
