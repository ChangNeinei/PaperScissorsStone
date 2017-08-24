//
//  PaperScissorsStoneViewController.swift
//  PaperScissorsStone
//
//  Created by Weiling Chang on 2017/8/24.
//  Copyright © 2017年 Lynne. All rights reserved.
//

import UIKit
import GameplayKit

class PaperScissorsStoneViewController: UIViewController {
    let choices = ["paper", "scissors", "stone"]
    var totalWin = 0
    var totalLoose = 0
   
    @IBOutlet weak var paperImageView: UIImageView!
    @IBOutlet weak var scissorsImageView: UIImageView!
    @IBOutlet weak var stoneImageView: UIImageView!
    @IBOutlet weak var robotImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var stoneButton: UIButton!
    
    @IBAction func again(_ sender: Any) {
        paperImageView.alpha = 1
        scissorsImageView.alpha = 1
        stoneImageView.alpha = 1
        resultLabel.text = "Paper   Scissor   Stone"
        robotImageView.image = UIImage(named: "BayMax")
        againButton.isHidden = true
        paperButton.isEnabled = true
        scissorsButton.isEnabled = true
        stoneButton.isEnabled = true
    }
    @IBAction func play(_ sender: UIButton) {
        againButton.isHidden = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        stoneButton.isEnabled = false
        let myChoice = choices[sender.tag]
        let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: choices.count - 1)
        let robotChoice = choices[randomChoice.nextInt()]
        robotImageView.image = UIImage(named: robotChoice)
        
        if paperImageView.tag != sender.tag{
            paperImageView.alpha = 0.3
        }
        if scissorsImageView.tag != sender.tag{
            scissorsImageView.alpha = 0.3
        }
        if stoneImageView.tag != sender.tag{
            stoneImageView.alpha = 0.3
        }
        
        if myChoice == "paper"{
            if robotChoice == "paper"{
                resultLabel.text = "Even"
            }
            else if robotChoice == "stone"{
                resultLabel.text = "You Win"
                totalWin = totalWin + 1
            }
            else {
                resultLabel.text = "You Loose"
                totalLoose += 1
            }
        }
        if myChoice == "scissors"{
            if robotChoice == "paper"{
                resultLabel.text = "You Win"
                totalWin += 1
            }
            else if robotChoice == "stone"{
                resultLabel.text = "You Loose"
                totalLoose += 1
            }
            else {
                resultLabel.text = "Even"
            }
        }
        if myChoice == "stone"{
            if robotChoice == "paper"{
                resultLabel.text = "You Loose"
                totalLoose += 1
            }
            else if robotChoice == "stone"{
                resultLabel.text = "Even"
            }
            else {
                resultLabel.text = "You Win"
                totalWin += 1
            }
        }
        totalLabel.text = "戰績: \(totalWin) 勝 \(totalLoose) 敗"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        againButton.isHidden = true
        totalLabel.text = "戰績: \(totalWin) 勝 \(totalLoose) 敗"
        paperButton.isEnabled = true
        scissorsButton.isEnabled = true
        stoneButton.isEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
