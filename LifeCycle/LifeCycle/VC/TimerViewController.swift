//
//  TimerViewController.swift
//  LifeCycle
//
//  Created by YOUNG on 2021/07/20.
//

import UIKit
var currenTotalTime: Double = 0.0

class TimerViewController: UIViewController, UITableViewDelegate {

    var laps : [String] = [] // 기록을 담는 배열
    let mainStopwatch : Stopwatch = Stopwatch() // 한번에 값을 넣기 위해서 만든 class
    let labStopwatch : Stopwatch = Stopwatch()
    var isPlaying : Bool = false
    let timeInterval : Double = 0.035
    var minute: Double = 60

    

    
    var seconds : String = ""
    var timer: Timer? = nil
    var timeWhenGoBackground: Date?
   // let interval = Int(Date().timeIntervalSince(start))
    
    @IBOutlet weak var lapResetButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var mainTimerLabel: UILabel!
    @IBOutlet weak var lapsTableView: UITableView!
    let initCircleButton: (UIButton) -> Void = { button in
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initCircleButton(playPauseButton)
        initCircleButton(lapResetButton)
        initalizeButtons()
        
        lapsTableView.delegate = self; // table 데이터 보내기
        lapsTableView.dataSource = self;
        // Do any additional setup after loading the view.
        
        
        let data = UserDefaults.standard
        let myarray = data.stringArray(forKey: "laps") ?? [String]()
        laps = myarray
        
        let timedata = UserDefaults.standard
        let time = timedata.double(forKey: "time")
        currenTotalTime = time
        
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        

    }
    
    @objc func appMovedToBackground() {
            print("App moved to background!")
            if isPlaying {
                timeWhenGoBackground = Date()
                print("Save: \(timeWhenGoBackground)")
            }
        }

    @objc func appMovedToForeground() {
        print("App moved to foreground")
        if let backTime = timeWhenGoBackground {
            let elapsed = Date().timeIntervalSince(backTime)
            let duration = Int(elapsed)
            currenTotalTime += Double(duration)

            timeWhenGoBackground = nil


        }
    }
    
    
    @IBAction func playPauseTimer(_ sender: AnyObject) {
        lapResetButton.isEnabled = true
        if isPlaying {
            pauseTimer()
        } else {
            playTimer()
        }
    }
    
    
    @IBAction func lapResetTimer(_ sender: AnyObject) {
        if isPlaying {
            if let timerLabelText = mainTimerLabel.text {
                laps.append(timerLabelText)
            }

            
            labStopwatch.counter = 0.0
            
            lapsTableView.reloadData()
        } else {
            initalizeButtons()
        }
    }
    
    
    @objc func updateMainTimer() {
        updateTimer(stopwatch: mainStopwatch, label: mainTimerLabel)
    }
    
    
    private func pauseTimer() {
        mainStopwatch.timer.invalidate()
        labStopwatch.timer.invalidate()
        
        self.isPlaying = false
        
        changeButton(button: lapResetButton, title: "RESET", titleColor: .black)
        changeButton(button: playPauseButton, title: "RESUME", titleColor: .green)
    }
    
    
    private func playTimer() {
        mainStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(updateMainTimer), userInfo: nil, repeats: true)
        
        
        RunLoop.current.add(mainStopwatch.timer, forMode: RunLoop.Mode.common)
        
        self.isPlaying = true

        changeButton(button: lapResetButton, title: "LAB", titleColor: .black)
        changeButton(button: playPauseButton, title: "STOP", titleColor: .red)
    }
    
    
    private func changeButton(button: UIButton, title: String, titleColor: UIColor) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
    }
    
    
    private func resetTimer(stopWatch: Stopwatch, label: UILabel) {
        stopWatch.timer.invalidate()
        currenTotalTime = 0.0
        label.text = "00:00:00"
        
    }
    
    
    private func initalizeButtons() {
        lapResetButton.isEnabled = false
        changeButton(button: lapResetButton, title: "LAB", titleColor: .gray)
        changeButton(button: playPauseButton, title: "START", titleColor: .green)
        
        resetTimer(stopWatch: mainStopwatch, label: mainTimerLabel)
        
        laps.removeAll()
        UserDefaults.standard.removeObject(forKey: "time")
        lapsTableView.reloadData()
    }

    
    private func updateTimer(stopwatch: Stopwatch, label: UILabel) {

        currenTotalTime = currenTotalTime + timeInterval
        
        print("currenTotalTime\(currenTotalTime)")
        var minutes: String = String(Int(currenTotalTime / minute))
        
        if Int(currenTotalTime / minute) < 10 {
            minutes = "0" + minutes
        }else {
            minutes = "\(minutes)"
        }
        
        var seconds: String = String(format: "%.2f", currenTotalTime.truncatingRemainder(dividingBy: minute))
        print("seconds1:\(seconds)")
        if currenTotalTime < 10 {
            seconds = "0" + seconds
        } else {
            seconds = "\(seconds)"
        }
        print("seconds2:\(seconds) : \(minutes)")
        label.text = minutes + ":" + seconds
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        lapsTableView.reloadData()
        let userDefaults = UserDefaults.standard
        userDefaults.set(laps, forKey: "laps") // 키, value 설정
        userDefaults.synchronize() // 동기화
        
        let userDefaults2 = UserDefaults.standard
        userDefaults2.set(currenTotalTime, forKey: "time")
        userDefaults2.synchronize() // 동기화
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let userDefaults2 = UserDefaults.standard
        userDefaults2.set(currenTotalTime, forKey: "time")
        userDefaults2.synchronize() // 동기화
    }
    
    
    
}


extension TimerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "lapCell", for: indexPath)
        
        if let labelNum = cell.viewWithTag(11) as? UILabel {
            labelNum.text = "Lap \(laps.count - (indexPath as NSIndexPath).row)"
        }
        if let mainLabelTimer = cell.viewWithTag(12) as? UILabel {
            mainLabelTimer.text = laps[laps.count - (indexPath as NSIndexPath).row - 1]
        }
        
        return cell
    }
    
    
}

