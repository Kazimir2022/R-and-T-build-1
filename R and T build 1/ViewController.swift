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
    override func loadView (){
        super.loadView()
print("loadView ViewController")
    }
    override func viewDidLoad() {
        
        print("viewDidLoad ViewController")
        
        super.viewDidLoad()
        genNumber = Int.random(in: 1...50)
        round += 1
        label.text = String(self.genNumber)
        
        let versionLababel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 50))//создаем новую текстовую метку
        versionLababel.text = "v. 1.1"
        self.view.addSubview(versionLababel)
    }
    
    
    
        override func viewWillAppear(_ animated:Bool){
            super.viewWillAppear(animated)
    print("viewWillAppear ViewController")
        }
        
        override func viewDidAppear(_ animated:Bool){
            super.viewDidAppear(animated)
    print("viewDidAppear ViewController")
        }
        override func viewWillDisappear(_ animated:Bool){
            super.viewWillDisappear(animated)
    print("viewWillDisappear ViewController")
        }
        override func viewDidDisappear(_ animated:Bool){
            super.viewDidDisappear(animated)
    print("viewDidDisappear ViewController")
        }
       
        

    @IBAction func checkResult() {
        
        let sliderNumber = Int(slider.value.rounded())
        
        if sliderNumber > self.genNumber{
            points += 50 - (sliderNumber - self.genNumber)
        } else if sliderNumber < self.genNumber{
            points += 50 - (self.genNumber - sliderNumber)
        } else {
            points += 50
        }
    
        
        
    if self.round == 5{
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

