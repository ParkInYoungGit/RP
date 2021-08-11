//
//  ViewController.swift
//  thread
//
//  Created by YOUNG on 2021/07/30.
//

import UIKit

class ViewController: UIViewController {
    
    var gameData : [data] = []
    
    let runLoop = RunLoop.current
    
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var firstGuestTimeLabel: UILabel!
    @IBOutlet weak var secondGuestTimeLabel: UILabel!
    @IBOutlet weak var thirdGuestTimeLabel: UILabel!
    @IBOutlet weak var bbangTimeLabel: UILabel!
    @IBOutlet weak var bbangTimeLabel2: UILabel!
    @IBOutlet weak var bbangTimeLabel3: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var finishView: UIView!
    @IBOutlet weak var finishCount: UILabel!
    @IBOutlet weak var prepareView: UIView!
    @IBOutlet weak var bbangImage: UIImageView!
    @IBOutlet weak var bbangImage2: UIImageView!
    @IBOutlet weak var bbangImage3: UIImageView!
    @IBOutlet weak var bbangImage4: UIImageView!
    @IBOutlet weak var guestImage1: UIImageView!
    @IBOutlet weak var guestImage2: UIImageView!
    @IBOutlet weak var guestImage3: UIImageView!
    @IBOutlet weak var bbangCoungLabel: UILabel!
    
    
    
    var tapped1: UITapGestureRecognizer!
    var tapped2: UITapGestureRecognizer!
    var tapped3: UITapGestureRecognizer!
    var tapped4: UITapGestureRecognizer!
    var gtapped1: UITapGestureRecognizer!
    var gtapped2: UITapGestureRecognizer!
    var gtapped3: UITapGestureRecognizer!
    
    var totalTimer = Timer()
    var guestTimer1 = Timer()
    var guestTime1: Int = 0
    var totalTime: Int = 0
    
    var guestTimer2 = Timer()
    var guestTime2: Int = 0
    
    var guestTimer3 = Timer()
    var guestTime3: Int = 0
    
    var bbangTimer1 = Timer()
    var bbangTime1: Int = 0
    
    var bbangTimer2 = Timer()
    var bbangTime2: Int = 0
    
    var bbangTimer3 = Timer()
    var bbangTime3: Int = 0
    
    var bbangTimer4 = Timer()
    var bbangTime4: Int = 0
    
    var bbang1IsCompleted: Bool = false
    var bbang2IsCompleted: Bool = false
    var bbang3IsCompleted: Bool = false
    var bbang4IsCompleted: Bool = false
    
    var count = 0
    var bbangCount = 0
    
    @IBOutlet weak var prepareviewRadius: UIView!
    @IBOutlet weak var finishViewRadius: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareGame()
        print("viewDidLoad")
        count = 0
        bbangCount = 0
        countLabel.text = String(count)
        bbangCoungLabel.text = String(bbangCount)
        finishView.isHidden = true
        firstImageChange()
        bbangPoint()
        prepareviewRadius.layer.cornerRadius = 10
        finishViewRadius.layer.cornerRadius = 10
        
    }
    //MARK: - imageChange
    
    func firstImageChange(){

        tapped1 = UITapGestureRecognizer(target: self, action: #selector(imageChanges(_:)))
        tapped1.numberOfTapsRequired = 1
        self.bbangImage.addGestureRecognizer(tapped1)
        self.bbangImage.isUserInteractionEnabled = true

        tapped2 = UITapGestureRecognizer(target: self, action: #selector(imageChanges(_:)))
        tapped2.numberOfTapsRequired = 1
        self.bbangImage2.addGestureRecognizer(tapped2)
        self.bbangImage2.isUserInteractionEnabled = true

        tapped3 = UITapGestureRecognizer(target: self, action: #selector(imageChanges(_:)))
        tapped3.numberOfTapsRequired = 1
        self.bbangImage3.addGestureRecognizer(tapped3)
        self.bbangImage3.isUserInteractionEnabled = true

        tapped4 = UITapGestureRecognizer(target: self, action: #selector(imageChanges(_:)))
        tapped4.numberOfTapsRequired = 1
        self.bbangImage4.addGestureRecognizer(tapped4)
        self.bbangImage4.isUserInteractionEnabled = true
    }
    
    func bbangPoint(){
        gtapped1 = UITapGestureRecognizer(target: self, action: #selector(bbangGuest(_:)))
        self.guestImage1.addGestureRecognizer(gtapped1)
        self.guestImage1.isUserInteractionEnabled = true
        
        gtapped2 = UITapGestureRecognizer(target: self, action: #selector(bbangGuest(_:)))
        self.guestImage2.addGestureRecognizer(gtapped2)
        self.guestImage2.isUserInteractionEnabled = true
        
        gtapped3 = UITapGestureRecognizer(target: self, action: #selector(bbangGuest(_:)))
        self.guestImage3.addGestureRecognizer(gtapped3)
        self.guestImage3.isUserInteractionEnabled = true
    }
    
    
    @objc func bbangGuest(_ sender : UITapGestureRecognizer){
        if sender == gtapped1 {
            if bbangCount != 0 {
                count = count + 1
                bbangCount = bbangCount - 1
                countLabel.text = String(count)
                bbangCoungLabel.text = String(bbangCount)
                guestImage1.image = nil
                guestTimer1.invalidate()
                guestTime1 = 0
                DispatchQueue.global(qos: .userInitiated).async {
                    usleep(2000000)
                    DispatchQueue.main.async {
                    self.gTimer1()
                    }
                }
            } else if bbangCount == 0 {
                gtapped1.isEnabled = false
            }
        }
        
        if sender == gtapped2 {
            if bbangCount != 0 {
                count = count + 1
                bbangCount = bbangCount - 1
                countLabel.text = String(count)
                bbangCoungLabel.text = String(bbangCount)
                guestImage2.image = nil
                guestTimer2.invalidate()
                guestTime2 = 0
                DispatchQueue.global(qos: .userInitiated).async {
                    usleep(2000000)
                    DispatchQueue.main.async {
                    self.gTimer2()
                    }
                }
            } else if bbangCount == 0 {
                gtapped2.isEnabled = false
            }
        }
        
        if sender == gtapped3 {
            if bbangCount != 0 {
                count = count + 1
                bbangCount = bbangCount - 1
                countLabel.text = String(count)
                bbangCoungLabel.text = String(bbangCount)
                guestImage3.image = nil
                guestTimer3.invalidate()
                guestTime3 = 0
                DispatchQueue.global(qos: .userInitiated).async {
                    usleep(2000000)
                    DispatchQueue.main.async {
                    self.gTimer3()
                    }
                }
            } else if bbangCount == 0 {
                gtapped3.isEnabled = false
            }
        }
    }
    
    
    @objc func imageSuccess(_ sender : UITapGestureRecognizer){
        if sender == tapped1{
            bbangTimer1.invalidate()
            bbangImage.image = UIImage(named: "bbang0.png")
            bbangCount = bbangCount + 1
            bbangCoungLabel.text = String(bbangCount)
            countLabel.text = String(count)
            bbangTime1 = 0
            tapped1 = UITapGestureRecognizer(target: self, action: #selector(imageChanges(_:)))
            self.bbangImage.addGestureRecognizer(tapped1)
            self.bbangImage.isUserInteractionEnabled = true
        }
        if sender == tapped2{
            bbangTimer2.invalidate()
            bbangImage2.image = UIImage(named: "bbang0.png")
            bbangCount = bbangCount + 1
            bbangCoungLabel.text = String(bbangCount)
            countLabel.text = String(count)
            bbangTime2 = 0
            tapped2 = UITapGestureRecognizer(target: self, action: #selector(imageChanges(_:)))
            self.bbangImage2.addGestureRecognizer(tapped2)
            self.bbangImage2.isUserInteractionEnabled = true
        }
        if sender == tapped3{
            bbangTimer3.invalidate()
            bbangImage3.image = UIImage(named: "bbang0.png")
            bbangCount = bbangCount + 1
            bbangCoungLabel.text = String(bbangCount)
            countLabel.text = String(count)
            bbangTime3 = 0
            tapped3 = UITapGestureRecognizer(target: self, action: #selector(imageChanges(_:)))
            self.bbangImage3.addGestureRecognizer(tapped3)
            self.bbangImage3.isUserInteractionEnabled = true
        }
        if sender == tapped4{
            bbangTimer4.invalidate()
            bbangImage4.image = UIImage(named: "bbang0.png")
            bbangCount = bbangCount + 1
            bbangCoungLabel.text = String(bbangCount)
            countLabel.text = String(count)
            bbangTime4 = 0
            tapped4 = UITapGestureRecognizer(target: self, action: #selector(imageChanges(_:)))
            self.bbangImage4.addGestureRecognizer(tapped4)
            self.bbangImage4.isUserInteractionEnabled = true
        }
        
    }
    
    
    @objc func imageChange(_ sender: UITapGestureRecognizer){
        if sender == tapped1{
            bbangTimer1.invalidate()
            bbangImage.image = UIImage(named: "bbang0.png")
            tapped1 = UITapGestureRecognizer(target: self, action: #selector(imageChanges(_:)))
            count = count - 1
            countLabel.text = String(count)
            bbangTime1 = 0
            tapped1.numberOfTapsRequired = 1
            self.bbangImage.addGestureRecognizer(tapped1)
            self.bbangImage.isUserInteractionEnabled = true
        }
            
        if sender == tapped2{
            bbangTimer2.invalidate()
            count = count - 1
            countLabel.text = String(count)
            bbangTime2 = 0
            bbangImage2.image = UIImage(named: "bbang0.png")
            tapped2 = UITapGestureRecognizer(target: self, action: #selector(imageChanges(_:)))
            tapped2.numberOfTapsRequired = 1
            self.bbangImage2.addGestureRecognizer(tapped2)
            self.bbangImage2.isUserInteractionEnabled = true
        }
            
        if sender == tapped3{
            bbangTimer3.invalidate()
            bbangTime3 = 0
            count = count - 1
            countLabel.text = String(count)
            bbangImage3.image = UIImage(named: "bbang0.png")
            tapped3 = UITapGestureRecognizer(target: self, action: #selector(imageChanges(_:)))
            tapped3.numberOfTapsRequired = 1
            self.bbangImage3.addGestureRecognizer(tapped3)
            self.bbangImage3.isUserInteractionEnabled = true
        }
            
        if sender == tapped4{
            bbangTimer4.invalidate()
            bbangTime4 = 0
            count = count - 1
            countLabel.text = String(count)
            bbangImage4.image = UIImage(named: "bbang0.png")
            tapped4 = UITapGestureRecognizer(target: self, action: #selector(imageChanges(_:)))
            tapped4.numberOfTapsRequired = 1
            self.bbangImage4.addGestureRecognizer(tapped4)
            self.bbangImage4.isUserInteractionEnabled = true
        }
    }

    @objc func imageChanges(_ sender: UITapGestureRecognizer) {
        if sender == tapped1 {
            bbangTime1 = 0
            bbangImage.image = UIImage(named: "bbang1.png")
            tapped1 = UITapGestureRecognizer(target: self, action: #selector(imageChanges2(_:)))
            tapped1.numberOfTapsRequired = 1
            self.bbangImage.addGestureRecognizer(tapped1)
            self.bbangImage.isUserInteractionEnabled = true
        }
        
        if sender == tapped2 {
            bbangImage2.image = UIImage(named: "bbang1.png")
            tapped2 = UITapGestureRecognizer(target: self, action: #selector(imageChanges2(_:)))
            tapped2.numberOfTapsRequired = 1
            self.bbangImage2.addGestureRecognizer(tapped2)
            self.bbangImage2.isUserInteractionEnabled = true
        }
        
        if sender == tapped3 {
            bbangImage3.image = UIImage(named: "bbang1.png")
            tapped3 = UITapGestureRecognizer(target: self, action: #selector(imageChanges2(_:)))
            tapped3.numberOfTapsRequired = 1
            self.bbangImage3.addGestureRecognizer(tapped3)
            self.bbangImage3.isUserInteractionEnabled = true
        }
        
        if sender == tapped4 {
            bbangImage4.image = UIImage(named: "bbang1.png")
            tapped4 = UITapGestureRecognizer(target: self, action: #selector(imageChanges2(_:)))
            tapped4.numberOfTapsRequired = 1
            self.bbangImage4.addGestureRecognizer(tapped4)
            self.bbangImage4.isUserInteractionEnabled = true
        }
    }


    
    @objc func imageChanges2(_ sender: UITapGestureRecognizer) {
        if sender == tapped1 {
        bbangImage.image = UIImage(named: "bbang2.png")
        tapped1 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        tapped1.numberOfTapsRequired = 1
        self.bbangImage.addGestureRecognizer(tapped1)
        self.bbangImage.isUserInteractionEnabled = true
        }
        
        if sender == tapped2 {
            bbangImage2.image = UIImage(named: "bbang2.png")
            tapped2 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
            tapped2.numberOfTapsRequired = 1
            self.bbangImage2.addGestureRecognizer(tapped2)
            self.bbangImage2.isUserInteractionEnabled = true
        }
        
        if sender == tapped3 {
            bbangImage3.image = UIImage(named: "bbang2.png")
            tapped3 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
            tapped3.numberOfTapsRequired = 1
            self.bbangImage3.addGestureRecognizer(tapped3)
            self.bbangImage3.isUserInteractionEnabled = true
        }
        
        if sender == tapped4 {
            bbangImage4.image = UIImage(named: "bbang2.png")
            tapped4 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
            tapped4.numberOfTapsRequired = 1
            self.bbangImage4.addGestureRecognizer(tapped4)
            self.bbangImage4.isUserInteractionEnabled = true
        }
        
        
    }
    

    // 붕어빵 timer start
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        
        if sender == tapped1 {
        bbangImage.image = UIImage(named: "bbang3.png")
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.bTimer1()
                print("tapped")
            }
            }
        }
        
        if sender == tapped2 {
        bbangImage2.image = UIImage(named: "bbang3.png")
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.bTimer2()
                print("tapped")
            }
            }
        }
        
        if sender == tapped3 {
        bbangImage3.image = UIImage(named: "bbang3.png")
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.bTimer3()
                print("tapped")
            }
            }
        }
        
        if sender == tapped4 {
        bbangImage4.image = UIImage(named: "bbang3.png")
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.bTimer4()
                print("tapped")
            }
            }
        }
        
        
        
    }
    
    // MARK: - Game
    // 게임 준비 화면
    func prepareGame() {
        prepareView.isHidden = false
        finishView.isHidden = true
    }

    // 게임 시작 버튼 눌렀을 때
    @IBAction func btnStart(_ sender: Any) {
        startGame()
        bbangCoungLabel.text = String(bbangCount)
        countLabel.text = String(count)
        prepareView.isHidden = true
        finishView.isHidden = true
    }
    
    // 게임 시작
    func startGame() {
        resetTimer()
        bbangCount = 0
        count = 0
        totalTime = 0
        guestTime1 = 0
        guestTime2 = 0
        guestTime3 = 0
        bbangTime1 = 0
        bbangTime2 = 0
        bbangTime3 = 0
        guestImage1.image = nil
        guestImage2.image = nil
        guestImage3.image = nil
        bbangImage.image = nil
        bbangImage2.image = nil
        bbangImage3.image = nil
        bbangImage4.image = nil
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.mainTimer()
            }
        }
        DispatchQueue.global(qos: .userInitiated).async {
            usleep(2000000)
            DispatchQueue.main.async {
            self.gTimer1()
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            usleep(5000000)
            DispatchQueue.main.async {
            self.gTimer2()
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            usleep(8000000)
            DispatchQueue.main.async {
            self.gTimer3()
            }
        }
    }
    
    // 게임 종료
    func finishGame(){
        finishView.isHidden = false
        bbangCoungLabel.text = String(bbangCount)
        finishCount.text = String(count)
        resetTimer()
        
    }
    // 게임 종료 후 닫기 버튼
    @IBAction func btnClose(_ sender: Any) {
        prepareGame()
    }
    
    //모든 타이머 리셋
    func resetTimer(){
        totalTimer.invalidate()
        guestTimer1.invalidate()
        guestTimer2.invalidate()
        guestTimer3.invalidate()
        bbangTimer1.invalidate()
        bbangTimer2.invalidate()
        bbangTimer3.invalidate()
        bbangTimer4.invalidate()
    }
    
    //MARK: -Timer
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
    
    func bTimer1(){
        bbangTimer1.invalidate()
        bbangTimer1 = Timer.scheduledTimer(timeInterval: 1/60, target: self, selector: #selector(bbangTimerCallback1), userInfo: nil, repeats: true)
    }
    
    func bTimer2(){
        bbangTimer2.invalidate()
        bbangTimer2 = Timer.scheduledTimer(timeInterval: 1/60, target: self, selector: #selector(bbangTimerCallback2), userInfo: nil, repeats: true)
    }
    
    func bTimer3(){
        bbangTimer3.invalidate()
        bbangTimer3 = Timer.scheduledTimer(timeInterval: 1/60, target: self, selector: #selector(bbangTimerCallback3), userInfo: nil, repeats: true)
    }
    
    func bTimer4(){
        bbangTimer4.invalidate()
        bbangTimer4 = Timer.scheduledTimer(timeInterval: 1/60, target: self, selector: #selector(bbangTimerCallback4), userInfo: nil, repeats: true)
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
        if count == -3 {
            finishGame()
        }
        if seconds == "30" {
            finishGame()
        }
}
    
    
    //MARK: -TimerCallback
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

        if seconds == "00" {
            guestImage1.image = UIImage(named: "guest.png")
        }
        if seconds == "08" {
            guestImage1.image = UIImage(named: "angry.png")
        }
        if seconds == "15" {
            guestImage1.image = UIImage(named: "angry.png")
            count += -1
            countLabel.text = String(count)
            guestTime1 = 0
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
    
        if seconds == "00" {
            guestImage2.image = UIImage(named: "guest.png")
        }
        if seconds == "08" {
            guestImage2.image = UIImage(named: "angry.png")
        }
        if seconds == "15" {
            guestImage1.image = UIImage(named: "angry.png")
            count += -1
            countLabel.text = String(count)
            guestTime2 = 0
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
    
        if seconds == "00" {
            guestImage3.image = UIImage(named: "guest.png")
        }
        if seconds == "08" {
            guestImage3.image = UIImage(named: "angry.png")
        }
        if seconds == "15" {
            guestImage1.image = UIImage(named: "angry.png")
            count += -1
            countLabel.text = String(count)
            guestTime3 = 0
            gTimer3()
        }
    }

    @objc func bbangTimerCallback1() {
        bbangTime1 += 1
        
        var minutes: String?
        var seconds: String?
        
        if (bbangTime1 / 3600) < 10 {
            minutes = "0\(bbangTime1 / 3600)"
        } else{
            minutes = "\(bbangTime1 / 3600)"
        }
        
        if (bbangTime1 / 60) < 10 {
            seconds = "0\(bbangTime1/60)"
        } else {
            seconds = "\(bbangTime1/60)"
        }
      
        if seconds == "05" {
            bbangImage.image = UIImage(named:"bbang4.png")
            bbang1IsCompleted = true
            tapped1 = UITapGestureRecognizer(target: self, action: #selector(imageSuccess(_:)))
            tapped1.numberOfTapsRequired = 1
            self.bbangImage.addGestureRecognizer(tapped1)
            self.bbangImage.isUserInteractionEnabled = true
        }
        if seconds == "10" {
            bbangTimer1.invalidate()
            bbang1IsCompleted = false
            bbangImage.image = UIImage(named:"bbang5.png")
            tapped1 = UITapGestureRecognizer(target: self, action: #selector(imageChange(_:)))
            tapped1.numberOfTapsRequired = 1
            self.bbangImage.addGestureRecognizer(tapped1)
            self.bbangImage.isUserInteractionEnabled = true
        }
        
    }

    @objc func bbangTimerCallback2() {
        bbangTime2 += 1
        
        // 숫자 문자 구별잘하기
        
        var minutes: String?
        var seconds: String?
        
        if (bbangTime2 / 3600) < 10 {
            minutes = "0\(bbangTime2 / 3600)"
        } else{
            minutes = "\(bbangTime2 / 3600)"
        }
        
        if (bbangTime2 / 60) < 10 {
            seconds = "0\(bbangTime2 / 60)"
        } else {
            seconds = "\(bbangTime2/60)"
        }
        
        if seconds == "05" {
            bbangImage2.image = UIImage(named:"bbang4.png")
            bbang2IsCompleted = true
            tapped2 = UITapGestureRecognizer(target: self, action: #selector(imageSuccess(_:)))
            tapped2.numberOfTapsRequired = 1
            self.bbangImage2.addGestureRecognizer(tapped2)
            self.bbangImage2.isUserInteractionEnabled = true
        }
        if seconds == "10" {
            bbang2IsCompleted = false
            bbangImage2.image = UIImage(named:"bbang5.png")
            tapped2 = UITapGestureRecognizer(target: self, action: #selector(imageChange(_:)))
            tapped2.numberOfTapsRequired = 1
            self.bbangImage2.addGestureRecognizer(tapped2)
            self.bbangImage2.isUserInteractionEnabled = true
        }
    }

    @objc func bbangTimerCallback3() {
        bbangTime3 += 1
        
        var minutes: String?
        var seconds: String?
        
        if (bbangTime3 / 3600) < 10 {
            minutes = "0\(bbangTime3 / 3600)"
        } else{
            minutes = "\(bbangTime3 / 3600)"
        }
        
        if (bbangTime3 / 60) < 10 {
            seconds = "0\(bbangTime3 / 60)"
        } else {
            seconds = "\(bbangTime3/60)"
        }
       
        
        if seconds == "05" {
            bbangImage3.image = UIImage(named:"bbang4.png")
            bbang3IsCompleted = true
            tapped3 = UITapGestureRecognizer(target: self, action: #selector(imageSuccess(_:)))
            tapped3.numberOfTapsRequired = 1
            self.bbangImage3.addGestureRecognizer(tapped3)
            self.bbangImage3.isUserInteractionEnabled = true
        }
        if seconds == "10" {
            bbang3IsCompleted = false
            bbangImage3.image = UIImage(named:"bbang5.png")
            tapped3 = UITapGestureRecognizer(target: self, action: #selector(imageChange(_:)))
            tapped3.numberOfTapsRequired = 1
            self.bbangImage3.addGestureRecognizer(tapped3)
            self.bbangImage3.isUserInteractionEnabled = true
        }
    }

    @objc func bbangTimerCallback4() {
        bbangTime4 += 1
        
        var minutes: String?
        var seconds: String?
        
        if (bbangTime4 / 3600) < 10 {
            minutes = "0\(bbangTime4 / 3600)"
        } else{
            minutes = "\(bbangTime4 / 3600)"
        }
        
        if (bbangTime4 / 60) < 10 {
            seconds = "0\(bbangTime4 / 60)"
        } else {
            seconds = "\(bbangTime4/60)"
        }
        
        if seconds == "05" {
            bbangImage4.image = UIImage(named:"bbang4.png")
            bbang4IsCompleted = true
            tapped4 = UITapGestureRecognizer(target: self, action: #selector(imageSuccess(_:)))
            tapped4.numberOfTapsRequired = 1
            self.bbangImage4.addGestureRecognizer(tapped4)
            self.bbangImage4.isUserInteractionEnabled = true
        }
        if seconds == "10" {
            bbang4IsCompleted = false
            bbangImage4.image = UIImage(named:"bbang5.png")
            tapped4 = UITapGestureRecognizer(target: self, action: #selector(imageChange(_:)))
            tapped4.numberOfTapsRequired = 1
            self.bbangImage4.addGestureRecognizer(tapped4)
            self.bbangImage4.isUserInteractionEnabled = true
        }
    }
}//---------------------------------------

