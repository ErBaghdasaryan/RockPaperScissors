//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Er Baghdasaryan on 17.04.23.
//

import UIKit

class MainViewController: UIViewController, SignDelegate {
    
    @IBOutlet weak var changedText: UITextField!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    var firstButtonPressed: UIButton?
    @IBOutlet weak var firstPlayerScore: UITextField!
    @IBOutlet weak var secondplayerScore: UITextField!
   @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    
    
    @IBAction func isPressedRock(_ sender: UIButton) {
        if firstButtonPressed == nil {
            firstButtonPressed = sender
            changedText.text = player2.text
        }else {
         
            if firstButtonPressed == rockButton {
                showNoWinnerAlert()
            }
            else if firstButtonPressed == scissorsButton {
                showSecondCongratulationsAlert()
               
            }
            else if firstButtonPressed == paperButton {
                showFirstCongratulatiionsAlert()
            }
            resetButtons()
            changedText.text = player1.text
        }
    }
    
    @IBAction func isPressedPaper(_ sender: UIButton) {
        if firstButtonPressed == nil {
                firstButtonPressed = sender
            changedText.text = player2.text
        }else {
            
            if firstButtonPressed == paperButton {
                showNoWinnerAlert()
            }
            else if firstButtonPressed == rockButton {
                showFirstCongratulatiionsAlert()
            }
            else if firstButtonPressed == scissorsButton {
                showSecondCongratulationsAlert()
            }
            resetButtons()
            changedText.text = player1.text
        }
    }
    
    @IBAction func isPressed(_ sender: UIButton) {
        if firstButtonPressed == nil {
            firstButtonPressed = sender
            changedText.text = player2.text
        }else {
            
            if firstButtonPressed == scissorsButton {
                showNoWinnerAlert()
            }
            else if firstButtonPressed == paperButton {
                showSecondCongratulationsAlert()
            }
            else if firstButtonPressed == rockButton {
                showFirstCongratulatiionsAlert()
            }
            resetButtons()
            changedText.text = player1.text
        }
    }
    
    func changeTitle1(newString1: String) {
        player1.text = newString1
    }
    func changeTitle2(newString2: String) {
        player2.text = newString2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func showFirstCongratulatiionsAlert(){
        let alertController = UIAlertController(title: "Congratulations!", message: "Win \(player1.text!)!🎉", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    private func showSecondCongratulationsAlert() {
        let alertController = UIAlertController(title: "Congratulations!", message: "Win \(player2.text!)!🎉", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func showNoWinnerAlert() {
        let alertController = UIAlertController(title: "Nobody Wins!", message: "Don't Congratulations! 🎉🙃", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func resetButtons() {
            firstButtonPressed = nil
    }
    
    enum Sign {
        case paper
        case scissors
        case rock
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEditor" {
            let destinyVC = segue.destination as! SignViewController
            let destinyVC2 = segue.destination as! SignViewController
            
            destinyVC.firstText = player1.text ?? ""
            destinyVC2.secondText = player2.text ?? ""
            
            destinyVC.delegate = self
        }
    }
}


