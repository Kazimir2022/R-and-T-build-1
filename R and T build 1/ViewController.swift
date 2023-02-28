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
    var points:Int = 0
    var round:Int = 0
    var genNumber:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func checkResult() {
        
        if self.round == 0 {
            genNumber = Int.random(in: 1...50)
            round += 1
            label.text = String(self.genNumber)
            
        } else {
            let sliderNumber = Int(slider.value.rounded())

            if sliderNumber > self.genNumber{
                points += 50 - (sliderNumber - self.genNumber)
            } else if sliderNumber < self.genNumber{
                points += 50 - (self.genNumber - sliderNumber)
            } else {
                points += 50
            }
        }
        
        
        if self.round == 5 {
            let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "начать заново?", style: .default, handler: nil))
            self.present(alert, animated: true)
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }
        genNumber = Int.random(in: 1...50)
        label.text = String(self.genNumber)
        
        
        
    }
    
    
    
    
    

}

