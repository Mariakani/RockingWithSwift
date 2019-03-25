//
//  ViewController.swift
//  Random Game
//
//  Created by Mariak Achuoth on 2019-03-21.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain", "uk","us"]
        setUpUI()
        askQuestion()
    }
    
    
    func setUpUI()
    {
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    
    
    func askQuestion(action: UIAlertAction! = nil){
       countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = "\(countries[correctAnswer].uppercased()):   Score is \(score)"
        navigationController?.navigationBar.backgroundColor = UIColor.purple
  
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title : String?
        questionNum += 1
        
        if sender.tag == correctAnswer{
            title = "Correct !"
            score += 1
            
        }else{
            title = "Wrong! That is the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        if questionNum < 10
        {
            let action = UIAlertController(title: title, message: "", preferredStyle: .alert)
            action.addAction(UIAlertAction(title: "continue", style: .default, handler: askQuestion))
            present(action, animated: true)
        }else
        {
            let action2 = UIAlertController(title: "Game is over!!", message: "Your  final score is: \(score)", preferredStyle: .alert)
            action2.addAction(UIAlertAction(title: "Restart the Gane", style: .cancel, handler: { (UIAlertAction) in
                
                self.dismiss(animated: true, completion: {
                self.restartGame()
                })
            }))
            //action2.addAction(UIAlertAction(title: "Restart The game", style: .default, handler: askQuestion))
            present(action2, animated: true)
            
        }
        
    }
    func restartGame(){
        score = 0
        questionNum = 0
    }
}

