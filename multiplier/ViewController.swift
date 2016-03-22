//
//  ViewController.swift
//  multiplier
//
//  Created by Larisa Barbu on 21/02/2016.
//  Copyright © 2016 Larisa Barbu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var whatMultipleToAddBy: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var addToAddLabel: UILabel!
    @IBOutlet weak var addLabel: UIButton!
    
    //Properties
    var multiple = 0            //input from user
    var runningSum = 0
    let MAX_SUM = 50
    
    //Function to hide addToAddLabel and addLabel when Play Button is pressed
    
    @IBAction func onAddBtnPressed(sender: AnyObject!) {
        let newSum = runningSum + multiple
        updateLbl(runningSum, mul: multiple, newSum:newSum)
        runningSum += multiple
        
        if isGameOver() {
            restartGame()
        }
    }
    @IBAction func onPlayBtnPressed(sender: AnyObject!) {

        if whatMultipleToAddBy.text != nil && whatMultipleToAddBy.text != "" {
    
            logoImg.hidden = true
            whatMultipleToAddBy.hidden = true
            playButton.hidden = true
    
            addToAddLabel.hidden = false
            addLabel.hidden = false
            
            resetLbl()
            multiple = Int(whatMultipleToAddBy.text!)!
            runningSum = 0
    
        }
    }
    
    func restartGame() {
        multiple = 0
        whatMultipleToAddBy.text = ""
        whatMultipleToAddBy.hidden = false
        logoImg.hidden = false
        playButton.hidden = false
        addToAddLabel.hidden = true
        addLabel.hidden = true
        resetLbl()
    }
    
    func resetLbl() {
        addToAddLabel.text = "Press Add to add!"
    }
    
    func isGameOver() -> Bool {
        if runningSum >= MAX_SUM {
            return true
        } else {
            return false
        }
    }
    
    func updateLbl(oldSum: Int, mul: Int, newSum: Int) {
        addToAddLabel.text = "\(oldSum) + \(mul) = \(newSum)"
    }
    
}
