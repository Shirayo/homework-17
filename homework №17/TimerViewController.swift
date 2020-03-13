//
//  TimerViewController.swift
//  homework №17
//
//  Created by Shirayo on 12.03.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    var startPauseBoolean: Bool = false
    var timerNumber: Int = 0
    var timer: Timer?
    @IBOutlet weak var startPauseButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startPauseButton.layer.cornerRadius = 40
        resetButton.layer.cornerRadius = 40
    }
    
    func createTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
        self.timerNumber += 1
        self.timerLabel.text = String(self.timerNumber)
        }
    }
    
    @IBAction func startPauseButtonDidClick(_ sender: Any) {
        startPauseBoolean.toggle()
        if startPauseBoolean {
            startPauseButton.setTitle("Pause", for: .normal)
            createTimer()
        } else {
            startPauseButton.setTitle("Continue", for: .normal)
            timer!.invalidate()
        }
    }
    
    @IBAction func resetButtonDidClick(_ sender: Any) {
        timerNumber = 0
        timerLabel.text = String(self.timerNumber)
        startPauseButton.setTitle("Start", for: .normal)
        startPauseBoolean = false
        timer!.invalidate()
    }
    
}
