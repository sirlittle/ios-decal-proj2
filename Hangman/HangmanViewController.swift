//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet weak var hangmanImageView: UIImageView!
    @IBOutlet weak var guessMadeTextField: UITextField!
    var hangmanGame: Hangman = Hangman()
    
    
    @IBAction func makeGuess(sender: UIButton) {
        var curGuess = guessMadeTextField.text!
        var letters: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k","l","m","n","o","p","q", "r","s","t","u","v","w","x","y","z"]
        for letter in letters{
            if(letter.uppercaseString == curGuess || letter == curGuess){
                hangmanGame.guessLetter(letter)
                return
            }
        }
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message: "Incorrect Guess entered!", preferredStyle: .Alert)
            
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Ok", style: .Cancel) { action -> Void in
            self.guessMadeTextField.text = ""
        }
        actionSheetController.addAction(cancelAction)
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)

        //TODO Invalid guess
        
    }
    
    @IBAction func startNewGame(sender: UIButton) {
        hangmanGame = Hangman()
        hangmanGame.start()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hangmanGame.start()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

