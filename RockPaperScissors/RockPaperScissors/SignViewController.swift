//
//  SignViewController.swift
//  RockPaperScissors
//
//  Created by Er Baghdasaryan on 27.05.23.
//

import UIKit

protocol SignDelegate: AnyObject {
    func changeTitle1(newString1: String)
    func changeTitle2(newString2: String)
}
class SignViewController: UIViewController {
    
    weak var delegate: SignDelegate?
    var firstText: String = ""
    var secondText: String = ""
    @IBOutlet weak var firstPlayer: UITextField!
    @IBOutlet weak var secondPlayer: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstPlayer.text = firstText
        secondPlayer.text = secondText
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closedPage(_ sender: Any) {
        
        delegate?.changeTitle1(newString1: firstPlayer.text ?? "")
        delegate?.changeTitle2(newString2: secondPlayer.text ?? "")
        self.dismiss(animated: true)
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
