//
//  ViewController.swift
//  thread
//
//  Created by YOUNG on 2021/07/30.
//

import UIKit

class ViewController: UIViewController {
    
    var gameData : [data] = []
    
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var firstGuestTimeLabel: UILabel!
    @IBOutlet weak var secondGuestTimeLabel: UILabel!
    @IBOutlet weak var thirdGuestTimeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var finishView: UIView!
    @IBOutlet weak var finishCount: UILabel!
    @IBOutlet weak var prepareView: UIView!
    
    
    var totalTimer = Timer()
    var guestTimer1 = Timer()
    var guestTime1: Int = 0
    var totalTime: Int = 0
    
    var guestTimer2 = Timer()
    var guestTime2: Int = 0
    
    var guestTimer3 = Timer()
    var guestTime3: Int = 0
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareGame()
        print("viewDidLoad")
        count = 0
        countLabel.text = String(count)
        finishView.isHidden = true
    }

    func prepareGame() {
        prepareView.isHidden = false
        finishView.isHidden = true
    }

    
    @IBAction func btnStart(_ sender: Any) {
        startGame()
        prepareView.isHidden = true
    }
    
    @IBAction func btnClose(_ sender: Any) {
        prepareGame()
    }
    func startGame() {
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.mainTimer()
            }
        }
        DispatchQueue.global(qos: .userInitiated).async {
            usleep(1000000)
            DispatchQueue.main.async {
                self.gTimer1()
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            usleep(2000000)
            DispatchQueue.main.async {
                self.gTimer2()
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            usleep(3000000)
            DispatchQueue.main.async {
                self.gTimer3()
            }
        }
    }
    
    
    func finishGame(){
        totalTimer.invalidate()
        guestTimer1.invalidate()
        guestTimer2.invalidate()
        guestTimer3.invalidate()
        finishView.isHidden = false
        finishCount.text = String(count)
    }
    
    

    func mainTimer() {
        totalTimer.invalidate()
        totalTimer = Timer.scheduledTimer(timeInterval: 1/60, target: self, selector: #selector(mainTimerCallback), userInfo: nil, repeats: true)
    }

    
    func gTimer1(){
        guestTimer1.invalidate()
        guestTimer1 = Timer.scheduledTimer(timeInterval: 1/60, target: self, selector: #selector(guestTimerCallback), userInfo: nil, repeats: true)
    }
    
    func gTimer2(){
        guestTimer2.invalidate()
        guestTimer2 = Timer.scheduledTimer(timeInterval: 1/60, target: self, selector: #selector(guestTimerCallback2), userInfo: nil, repeats: true)
    }
    
    func gTimer3(){
        guestTimer3.invalidate()
        guestTimer3 = Timer.scheduledTimer(timeInterval: 1/60, target: self, selector: #selector(guestTimerCallback3), userInfo: nil, repeats: true)
    }
    
    
    
    
    
    
    
    
    @objc func mainTimerCallback() {
        totalTime += 1
        
        var minutes: String?
        var seconds: String?
        
        if (totalTime / 3600) < 10 {
            minutes = "0\(totalTime / 3600)"
        } else{
            minutes = "\(totalTime / 3600)"
        }
        
        if (totalTime / 60) < 10 {
            seconds = "0\(totalTime / 60)"
        } else if  (totalTime / 60) > 59 {
            let rest = totalTime / 60
            seconds = (rest % 60) < 10 ? "0\(rest%60)": "\(rest%60)"
        } else {
            seconds = "\(totalTime/60)"
        }
        totalTimeLabel.text = "\(minutes!) : \(seconds!)"
        if minutes == "03" {
            finishGame()
        }
        
        
        
        
    }

    @objc func guestTimerCallback() {
        guestTime1 += 1
        
        var minutes: String?
        var seconds: String?
        
        if (guestTime1 / 3600) < 10 {
            minutes = "0\(guestTime1 / 3600)"
        } else{
            minutes = "\(guestTime1 / 3600)"
        }
        
        if (guestTime1 / 60) < 10 {
            seconds = "0\(guestTime1 / 60)"
        } else {
            seconds = "\(guestTime1/60)"
        }
        firstGuestTimeLabel.text = "\(minutes!) : \(seconds!)"
        if seconds == "30" {
            count += -1
            countLabel.text = String(count)
            guestTime1 = 0
            usleep(2000000)
            gTimer1()
            
        }
    }
    
    @objc func guestTimerCallback2() {
        guestTime2 += 1
        
        var minutes: String?
        var seconds: String?
        
        if (guestTime2 / 3600) < 10 {
            minutes = "0\(guestTime2 / 3600)"
        } else{
            minutes = "\(guestTime2 / 3600)"
        }
        
        if (guestTime2 / 60) < 10 {
            seconds = "0\(guestTime2 / 60)"
        } else {
            seconds = "\(guestTime2/60)"
        }
        secondGuestTimeLabel.text = "\(minutes!) : \(seconds!)"
        if seconds == "30" {
            count += -1
            countLabel.text = String(count)
            guestTime2 = 0
            usleep(2000000)
            gTimer2()
        }
    }
    
    @objc func guestTimerCallback3() {
        guestTime3 += 1
        
        var minutes: String?
        var seconds: String?
        
        if (guestTime3 / 3600) < 10 {
            minutes = "0\(guestTime3 / 3600)"
        } else{
            minutes = "\(guestTime3 / 3600)"
        }
        
        if (guestTime3 / 60) < 10 {
            seconds = "0\(guestTime3 / 60)"
        } else {
            seconds = "\(guestTime3/60)"
        }
        thirdGuestTimeLabel.text = "\(minutes!) : \(seconds!)"
        if seconds == "30" {
            count += -1
            countLabel.text = String(count)
            guestTime3 = 0
            usleep(2000000)
            gTimer3()
        }
    }


}//---------------------------------------

