//
//  ViewController.swift
//  Hangman
//
//  Created by Salil Vanvari on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet weak var hangmanImageView: UIImageView!
    @IBOutlet weak var guessMadeTextField: UITextField!
    var hangmanGame: Hangman = Hangman()
    var counter: Int = 1
    @IBOutlet weak var toBeGuessedLabel: UILabel!
    @IBOutlet weak var guessesMade: UILabel!
    @IBOutlet weak var enterGuessButton: UIButton!
    
    @IBAction func makeGuess(sender: UIButton) {
        let curGuess = guessMadeTextField.text!
        let letters: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k","l","m","n","o","p","q", "r","s","t","u","v","w","x","y","z"]
        for letter in letters{

            if(letter.uppercaseString == curGuess || letter == curGuess){
                let yea: Bool = hangmanGame.guessLetter(letter.uppercaseString)
                if(!yea){
                    counter++
                    hangmanImageView.image = UIImage(named: "hangman\(self.counter)")
                    if(counter == 7){
                        let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message: "The poor man is dead 😲 Try again?", preferredStyle: .Alert)
                        
                        //Create and add the Cancel action
                        let cancelAction: UIAlertAction = UIAlertAction(title: "No", style: .Cancel) { action -> Void in
                            self.enterGuessButton.enabled = false
                            self.guessMadeTextField.enabled = false
                        }
                        actionSheetController.addAction(cancelAction)
                        let newGameAction: UIAlertAction = UIAlertAction(title: "Yes", style: .Default){ action -> Void in
                            self.hangmanGame = Hangman()
                            self.hangmanGame.start()
                            self.counter = 1
                            self.toBeGuessedLabel.text = self.hangmanGame.knownString
                            self.guessesMade.text = self.hangmanGame.guesses()
                            self.enterGuessButton.enabled = true
                            self.guessMadeTextField.enabled = true
                            self.hangmanImageView.image = UIImage(named: "hangman\(self.counter)")

                        }
                        actionSheetController.addAction(newGameAction)
                        //Present the AlertController
                        self.presentViewController(actionSheetController, animated: true, completion: nil)

                    }
                }
                if(hangmanGame.knownString == hangmanGame.answer){
                    let actionSheetController: UIAlertController = UIAlertController(title: "Congrats!", message: "You Won 🎉🎉🎉🎉! New Game?", preferredStyle: .Alert)
                    
                    //Create and add the Cancel action
                    let cancelAction: UIAlertAction = UIAlertAction(title: "No", style: .Cancel) { action -> Void in
                        self.enterGuessButton.enabled = false
                        self.guessMadeTextField.enabled = false
                    }
                    actionSheetController.addAction(cancelAction)
                    let newGameAction: UIAlertAction = UIAlertAction(title: "Yes", style: .Default){ action -> Void in
                        self.hangmanGame = Hangman()
                        self.hangmanGame.start()
                        self.counter = 1
                        self.toBeGuessedLabel.text = self.hangmanGame.knownString
                        self.guessesMade.text = self.hangmanGame.guesses()
                        self.enterGuessButton.enabled = true
                        self.guessMadeTextField.enabled = true
                        self.hangmanImageView.image = UIImage(named: "hangman\(self.counter)")
                        
                    }
                    actionSheetController.addAction(newGameAction)
                    //Present the AlertController
                    self.presentViewController(actionSheetController, animated: true, completion: nil)

                }
                hangmanImageView.image = UIImage(named: "hangman\(self.counter)")
                toBeGuessedLabel.text = hangmanGame.knownString
                guessesMade.text = hangmanGame.guesses()
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
    }
    
    @IBAction func startNewGame(sender: UIButton) {
        hangmanGame = Hangman()
        hangmanGame.start()
        counter = 1
        toBeGuessedLabel.text = hangmanGame.knownString
        guessesMade.text = hangmanGame.guesses()
        enterGuessButton.enabled = true
        guessMadeTextField.enabled = true
        hangmanImageView.image = UIImage(named: "hangman\(self.counter)")


    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hangmanGame.start()
        hangmanImageView.image = UIImage(named: "hangman\(self.counter)")
        toBeGuessedLabel.text = hangmanGame.knownString
        guessesMade.text = hangmanGame.guesses()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

