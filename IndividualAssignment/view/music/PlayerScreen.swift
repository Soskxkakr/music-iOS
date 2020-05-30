//
//  PlayerScreen.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 27/05/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerScreen: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songArtist: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var timerLbl: UILabel!
    
    var user = User()
    var timer : Timer!
    var timerToStop : Timer!
    var mySong = Song()
    var player = AVAudioPlayer()
    var countdownTimer = TimeInterval()
    var counter : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set player up
        self.image.image = mySong.image
        self.songTitle.text = mySong.title
        self.songArtist.text = mySong.artist
        
        slider.minimumValue = 0
        // Play the music
        playMusic()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pause(_ sender: UIButton) {
        player.pause()
    }
    
    @IBAction func play(_ sender: UIButton) {
        player.prepareToPlay()
        player.play()
    }
    
    @IBAction func stop(_ sender: UIButton) {
        player.stop()
        player.currentTime = 0
        slider.value = Float(player.currentTime)
    }
    
    @IBAction func back(_ sender: UIButton) {
        // Reset Everything
        timer.invalidate()
        if timerToStop != nil {
            timerToStop.invalidate()
        }
        counter = 0
        player.stop()
        player.currentTime = 0
        // Pass User Object Back
        performSegue(withIdentifier: "back", sender: self)
    }
    
    
    @IBAction func sliderChanged(_ sender: Any) {
        player.pause()
        let currentTime = slider.value
        player.currentTime = TimeInterval(currentTime)
        player.play()
    }
    
    @IBAction func initiateCountdown(_ sender: UIButton) {
        popUpView.isHidden = false
    }
    
    @IBAction func getCountdownTimer(_ sender: UIDatePicker) {
        self.countdownTimer = sender.countDownDuration
    }
    
    
    @IBAction func startCountdown(_ sender: UIButton) {
        self.counter = convertTimeIntervalToSec(self.countdownTimer)
        timerToStop = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        popUpView.isHidden = true
        
    }
    
    @IBAction func cancelCountdown(_ sender: UIButton) {
        popUpView.isHidden = true
    }
    
    @IBAction func stopCountdown(_ sender: UIButton) {
        timerToStop.invalidate()
        timerLbl.text = "0 Seconds"
    }
    
    func playMusic() {
        let musicUrl = Bundle.main.url(forResource: self.songArtist.text!+" - "+self.songTitle.text!, withExtension: "mp3")
        do {
            self.player = try AVAudioPlayer.init(contentsOf: musicUrl!)
            slider.maximumValue = Float(player.duration)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeSliderValue), userInfo: nil, repeats: true)
            self.player.prepareToPlay()
            self.player.play()
        } catch {
            print("error: "+error.localizedDescription)
        }
    }
    
    func convertTimeIntervalToSec(_ timeInterval : TimeInterval) -> Int {
        let ti = NSInteger(timeInterval)
        
//        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        let hours = ti / 3600
        let actualTime = (minutes*60) + (hours*60)
        
        return NSInteger(actualTime)
    }
    
    @objc func runTimer() {
        self.counter = counter - 1
        timerLbl.text = "\(self.counter) Seconds"
        if self.counter == 0 {
            timerToStop.invalidate()
            player.stop()
            player.currentTime = 0
            slider.value = Float(player.currentTime)
        }
    }
    
    @objc func changeSliderValue() {
        let currentValue = Float(player.currentTime)
        slider.value = currentValue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "back" {
            let homePage = segue.destination as! HomeController
            homePage.user = self.user
        }
    }
}
