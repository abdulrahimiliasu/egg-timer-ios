//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let EggDict = ["Soft":1,"Medium":7,"Hard":12]
    
    var  seconds = 5
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var timeProgressBar: UIProgressView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        var counter = EggDict[hardness]! * seconds
        let TotalTime = Float(counter)
        
        timeProgressBar.progress = 0.0
        var secondsPassed:Float = 0
        TitleLabel.text = hardness
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            (Timer) in
            if(counter > 0){
                secondsPassed += 1
                counter -= 1
                self.TimeLabel.text = String(counter) + "s"
                let timeProgress = secondsPassed/TotalTime
                self.timeProgressBar.progress = Float(timeProgress)
            }
            else{
                self.TitleLabel.text = "Done"
                Timer.invalidate()
                self.PlaySound()
            }
        }
    }
    
    func PlaySound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
