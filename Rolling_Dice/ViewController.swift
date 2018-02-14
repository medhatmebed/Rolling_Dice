//
//  ViewController.swift
//  Rolling_Dice
//
//  Created by medhat on 2/14/18.
//  Copyright © 2018 Medhatm3bd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var randomDiceIndex1 = 0
    var randomDiceIndex2 = 0
    let diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]

    @IBOutlet weak var rollBtn: RoundButton!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        updateDiceImages()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func rollBtnPressed(_ sender: UIButton) {
        updateDiceImages()
        addPulse()
    }
    func updateDiceImages() {
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    func addPulse(){
        let pulse = Pulsing(numberOfPulses: 1, radius: 110, position: rollBtn.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.red.cgColor
        
        self.view.layer.insertSublayer(pulse, below: rollBtn.layer)
        
    }
}

