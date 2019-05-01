//
//  OnePlayerViewController.swift
//  RockPaperScissors
//
//  Created by 劉學逸 on 4/30/19.
//  Copyright © 2019 劉學逸. All rights reserved.
//

import UIKit

class OnePlayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var myGame = onePlayerGame()

    @IBAction func stonePressed() {
        myGame.firstPlayerInput = .rock
    }
    @IBAction func paperPressed() {
         myGame.firstPlayerInput = .paper
    }
    @IBAction func scissorsPressed() {
         myGame.firstPlayerInput = .scissors
    }
    
    @IBAction func readyPressed() {
        var statement: String
        myGame.play()
        switch myGame.result {
        case .win:
            statement = "You Win 😎"
        case .lose:
            statement = "You Lose 😢"
        case .draw:
            statement = "It's a Draw 😬"
        default:
            statement = "Error: no result found"
        }
        let alert = UIAlertController(title: statement, message: "CPU: \(myGame.comInput) YOU: \(myGame.firstPlayerInput)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
        myGame = onePlayerGame() 
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
