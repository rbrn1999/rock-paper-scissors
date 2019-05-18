//
//  TwoPlayerViewController.swift
//  RockPaperScissors
//
//  Created by 劉學逸 on 5/18/19.
//  Copyright © 2019 劉學逸. All rights reserved.
//

import UIKit

class TwoPlayerViewController: UIViewController {
    
    @IBOutlet var FirstPlayerButtons: [UIButton]!
    @IBOutlet var secondPlayerButtons: [UIButton]!
    @IBOutlet weak var statusLabel: UILabel!
    
    var firstPlayerReady = false
    var secondPlayerReady = false
    var myGame = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func refresh(){
        if firstPlayerReady {
            for button in FirstPlayerButtons {
                button.isEnabled = false
                button.alpha = 0.5
                statusLabel.text = "1P Ready"
            }
        }
        if secondPlayerReady {
            for button in secondPlayerButtons {
                button.isEnabled = false
                button.alpha = 0.5
                statusLabel.text = "2P Ready"

            }
        }
        if firstPlayerReady && secondPlayerReady {
            myGame.play()
            switch myGame.result {
            case .win:
                statusLabel.text = "1P wins!"
            case .lose:
                statusLabel.text = "2P wins!"
            case .draw:
                statusLabel.text = "Draw"
            case .none:
                print("No result found")
            }
            myGame = Game()
            firstPlayerReady = false
            secondPlayerReady = false
            for button in FirstPlayerButtons {
                button.isEnabled = true
                button.alpha = 1.0
            }
            for button in secondPlayerButtons {
                button.isEnabled = true
                button.alpha = 1.0
            }
        }
    }
    
    @IBAction func rockPressed_1P(_ sender: Any) {
        myGame.firstPlayerInput = .rock
        firstPlayerReady = true
        refresh()
    }
    @IBAction func paperPressed_1P(_ sender: Any) {
        myGame.firstPlayerInput = .paper
        firstPlayerReady = true
        refresh()
    }
    @IBAction func scissorsPressed_1P(_ sender: Any) {
        myGame.firstPlayerInput = .scissors
        firstPlayerReady = true
        refresh()
    }
    
    @IBAction func rockPressed_2P(_ sender: Any) {
        myGame.secondPlayerInput = .rock
        secondPlayerReady = true
        refresh()
    }
    @IBAction func paperPressed_2P(_ sender: Any) {
        myGame.secondPlayerInput = .paper
        secondPlayerReady = true
        refresh()
    }
    @IBAction func scissorsPressed_2P(_ sender: Any) {
        myGame.secondPlayerInput = .scissors
        secondPlayerReady = true
        refresh()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
