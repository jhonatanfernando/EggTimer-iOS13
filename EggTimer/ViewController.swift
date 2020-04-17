//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var timer = Timer()
    let eggTimes = ["Soft":3, "Medium":4, "Hard":7]
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        secondsPassed = 0;
        progress.progress = 0.0;
        
        let hardness = sender.currentTitle!;
        
        totalTime = eggTimes[hardness]!
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
    }
    
    @objc func onTimerFires()
    {
        
        if secondsPassed < totalTime{
            let percentage = Float(secondsPassed) / Float(totalTime);
            progress.progress = percentage
            secondsPassed += 1
        }
        else {
            timer.invalidate()
            progress.progress = 1.0;
            labelTitle.text = "DONE"
        }
    }
    
}
