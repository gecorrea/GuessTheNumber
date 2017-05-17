//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by George E. Correa on 1/26/17.
//  Copyright © 2017 Turn To Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // number of guesses allowed
    let numberOfGuessesAllowed = 3
    
    // number of guesses remaining
    var numberOfGuessesRemaining = 3
    
    // the number
    var numberToGuess = 0
    
    // input (text field)
    @IBOutlet weak var guessTextField: UITextField!
    
    // ouputs (feedback, play again, guess)
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetGame()
    }

    // actions (check guess, play again)
    @IBAction func checkGuess() {
        
        // get the value of the text field
        // convert it to an integer
        guard let number = Int(guessTextField.text!)
            else {return}
        
        numberOfGuessesRemaining -= 1
        
        guessTextField.text = ""
        
        // check if it is the correct number
        // show feedback
        feedbackLabel.isHidden = false
        if number == numberToGuess {
            feedbackLabel.text = "Correct!"
            numberOfGuessesRemaining = 0
        }
        else if number > numberToGuess {
            feedbackLabel.text = "Too high."
        }
        else if number < numberToGuess {
            feedbackLabel.text = "Too low."
        }
        
        if numberOfGuessesRemaining == 0 {
            // hide guess button
            guessButton.isHidden = true
            // show whether the user won or lost
            if number == numberToGuess {
                feedbackLabel.text = "You Won!"
                feedbackLabel.textColor = .green
            }
            else {
                feedbackLabel.text = "You lose."
                feedbackLabel.textColor = .red
            }
            
            playAgainButton.isHidden = false
            
        }
        
    }
    @IBAction func playAgain() {
        resetGame()
    }
    
    func resetGame() {
        // reset number of available tries
        numberOfGuessesRemaining = numberOfGuessesAllowed
        // hide play again button
        playAgainButton.isHidden = true
        // unhide guess button
        guessButton.isHidden = false
        // hide feedback lable
        feedbackLabel.isHidden = true
        feedbackLabel.textColor = .black
        // generate a random number
        numberToGuess = Int(arc4random_uniform(21))
        print(numberToGuess)
    }
    
    @IBAction func DismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

}

