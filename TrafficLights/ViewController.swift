//
//  ViewController.swift
//  TrafficLights
//
//  Created by Jake Buller on 2016-11-01.
//  Copyright © 2016 Jake Buller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trafficLight: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var timer = Timer()
    var scoreTimer = Timer()
    
    var timerInt = 0
    var scoreInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label.text = String(scoreInt)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func startButtonClick(_ sender: Any) {
        if scoreInt == 0 {
            timerInt = 3
            trafficLight.image = UIImage(named: "TrafficLight")
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
            startButton.isEnabled = false
        } else {
            startButton.setTitle("Start", for: [])
            scoreTimer.invalidate()
            trafficLight.image = UIImage(named: "TrafficLight")
            scoreInt = 0
        }
    }
    
    func updateCounter() {
        timerInt -= 1
        
        if (timerInt == 2) {
            trafficLight.image = UIImage(named: "TrafficLight3")
        } else if (timerInt == 1) {
            trafficLight.image = UIImage(named: "TrafficLight2")
        } else {
            trafficLight.image = UIImage(named: "TrafficLight1")
            timer.invalidate()
            startButton.setTitle("Stop", for: [])
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(ViewController.updateScoreTimer), userInfo: nil, repeats: true)
            startButton.isEnabled = true
        }
    }
    
    func updateScoreTimer() {
        scoreInt += 1
        label.text = String(scoreInt)
    }
}

