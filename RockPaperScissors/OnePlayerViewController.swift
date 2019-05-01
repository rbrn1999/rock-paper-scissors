//
//  OnePlayerViewController.swift
//  RockPaperScissors
//
//  Created by 劉學逸 on 4/30/19.
//  Copyright © 2019 劉學逸. All rights reserved.
//

import UIKit
import CoreData

class OnePlayerViewController: UIViewController {

    var winCount = 0
    var loseCount = 0
    var curStreakCount = 0
    var longestStreak = 0
    
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    @IBOutlet weak var curStreakLabel: UILabel!
    @IBOutlet weak var longestStreakLabel: UILabel!
    
    override func viewDidLoad() {
        getDate()
        refreshLabel(nil)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var myGame = onePlayerGame()

    func refreshLabel(_ alert:UIAlertAction!){
        winLabel.text = "Win: \(winCount)"
        loseLabel.text = "Lose: \(loseCount)"
        curStreakLabel.text = "Current Streak: \(curStreakCount)"
        longestStreakLabel.text = "Longest Streak: \(longestStreak)"
    }
    
    func saveData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Player", in: context)
        let newEntiry = NSManagedObject(entity: entity!, insertInto: context)
        
        newEntiry.setValue(winCount, forKey: "wins")
        newEntiry.setValue(loseCount, forKey: "loses")
        newEntiry.setValue(curStreakCount, forKey: "curStreak")
        newEntiry.setValue(longestStreak, forKey: "longestStreak")
        
        do {
            try context.save()
            print("saved")
        } catch  {
            print("Failed saving")
        }
        
    }
    
    func getDate() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                winCount = data.value(forKey: "wins") as! Int
                loseCount = data.value(forKey: "loses") as! Int
                curStreakCount = data.value(forKey: "curStreak") as! Int
                longestStreak = data.value(forKey: "longestStreak") as! Int
            }
        } catch {
            print("Failed")
        }

    }
    
    @IBAction func stonePressed() {
        myGame.firstPlayerInput = .rock
    }
    @IBAction func paperPressed() {
         myGame.firstPlayerInput = .paper
    }
    @IBAction func scissorsPressed() {
         myGame.firstPlayerInput = .scissors
    }
    @IBAction func resetPressed(_ sender: Any) {
        winCount = 0
        loseCount = 0
        curStreakCount = 0
        longestStreak = 0
        saveData()
        refreshLabel(nil)
    }
    
    @IBAction func readyPressed() {
        var statement: String
        myGame.play()
        switch myGame.result {
        case .win:
            statement = "You Win 😎"
            winCount += 1
            curStreakCount += 1
            curStreakCount > longestStreak ? longestStreak = curStreakCount : nil
        case .lose:
            statement = "You Lose 😢"
            loseCount += 1
            curStreakCount = 0
        case .draw:
            statement = "It's a Draw 😬"
        default:
            statement = "Error: no result found"
        }
        saveData()
        let alert = UIAlertController(title: statement, message: "CPU: \(myGame.comInput) YOU: \(myGame.firstPlayerInput)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: refreshLabel))
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
