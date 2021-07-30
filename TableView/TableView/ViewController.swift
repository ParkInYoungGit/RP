//
//  ViewController.swift
//  TableView
//
//  Created by YOUNG on 2021/07/22.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource{
    
    @IBOutlet var tableListView: UITableView!
    @IBOutlet weak var calendar: FSCalendar!
    
    var workOutList: [Users] = []
    var selecteDate = ""
    var currentDate = ""
    let dateFormatter = DateFormatter()
    var eventDate : [Date] = [] // calendar에 표시해주는 Arr
    var selectData: [String] = [] // 선택한 날짜 별로 모아준 Arr
    var dateArr : [String] = [] // 데이터 입력 날짜만 모아둔 Arr
    var allDictionaries : [String : String] = [:] // 객체를 Dic으로 변환한
    var workNameDic : [String : String] = [:] // 운동 이름과 날짜 받아올 Dic
    var workNameArr : [String] = [] //운동이름만 넣을 Arr
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // data 불러오기
        if let data = UserDefaults.standard.value(forKey:"workOutList") as? Data {
            let users = try? PropertyListDecoder().decode([Users].self, from: data)
            workOutList = users!
        }
        value()
        
            
        print("viewdidload")
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = DateFormatter()
        date.locale = Locale(identifier: "ko")
        date.dateFormat = "yyyy-MM-dd"
        calendar.delegate = self
        calendar.dataSource = self
        calendarSetup()
        selecteDate = date.string(from: Date())
        currentDate = date.string(from: Date())


            
        calendarEvent()
        // Delegate = self -> 제스쳐, UI
        tableListView.delegate = self
        
        // DataSource = self -> 데이터관리
        tableListView.dataSource = self
    
        tableListView.reloadData()
        selecteDate = currentDate
        for string in dateArr {
            if string.starts(with: selecteDate){
                selectData.append(string)
                print("selectDataArr\(selectData)")
            }
        }
        if workOutList.count == 0 {
        } else {
            for i in 0...dateArr.count - 1 {
                if workOutList[i].date == selecteDate{
                    workNameArr.append(workOutList[i].workName!)
                    print("worknameArr  \(workNameArr)")
                }
            }
        }
        tableListView.reloadData()
        
    }
    
    func value (){
        // date값만 배열로 변환
       //array of all dictionaries.
           for data in workOutList {
              let  dictionary = [
                "date" : data.date!
              ]
              allDictionaries = dictionary
            for data2 in allDictionaries.values{
                dateArr.append(data2)
                print("djfuqemm\(dateArr)")
            }
           }
    }



    func calendarEvent (){
        if workOutList.count == 0 {
        } else {
            for i in 0...workOutList.count - 1 {
                eventDate.append(dateFormatter.date(from:workOutList[i].date!)!)
            }
        }
    }
    
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectData.removeAll()
        workNameArr.removeAll()
        selecteDate = dateFormatter.string(from: date)
        tableListView.reloadData()
        print(dateFormatter.string(from: date) + " 선택됨")
        print(selecteDate + " 선택됨")
        
        
        
        for string in dateArr {
            if string.starts(with: selecteDate){
                selectData.append(string)
                print("selectDataArr\(selectData)")
            }
        }
        if workOutList.count == 0 {
        } else {
            for i in 0...dateArr.count - 1 {
                if workOutList[i].date == selecteDate{
                    workNameArr.append(workOutList[i].workName!)
                    print("worknameArr  \(workNameArr)")
                }
            }
        }
        tableListView.reloadData()

    }
    
    // 캘린더 setting
    func calendarSetup(){
        calendar.appearance.selectionColor = UIColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1)
        calendar.appearance.todayColor = UIColor(red: 188/255, green: 224/255, blue: 253/255, alpha: 1)
        calendar.scrollEnabled = true
        calendar.scrollDirection = .vertical
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        //calendar.appearance.headerTitleColor = UIColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1
        //)
        calendar.locale = Locale(identifier: "ko_KR")
    }

    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if self.eventDate.contains(date){
            return 1
        }
        return 0
    }
        
        
} //-----------------------------

    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        /// tableView에 cell을 만들 개수를 설정하는 프로토콜 메소드
        func tableView(_ tableView: UITableView,
                       numberOfRowsInSection section: Int) -> Int {
            
            if !selectData.isEmpty {
                return selectData.count
            }
            return 1
        }
        
        
        /// tableView에 cell 어떤 cell로 구성할지 설정하는 프로토콜 메소드
        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
            
            // 외부에 UITableViewCell이 있는 경우
            // let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ExamTableViewCell

            // UITableview 내부에 있는 경우
           let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

            
            if !selectData.isEmpty {
                //cell.textLabel?.text = selectData[indexPath.row]
                cell.textLabel?.text = workNameArr[indexPath.row]
            }
            else {
                cell.textLabel?.text = "해당 날짜에는 운동 기록이 없습니다."
            }
            // cell.textLabel?.text = "\(users.workName!) \(users.setNum!)세트 \(users.countNum!)회"
            return cell
        }
        
        
        override func viewWillAppear(_ animated: Bool) {
            // data 불러오기
            if let data = UserDefaults.standard.value(forKey:"workOutList") as? Data {
                let users = try? PropertyListDecoder().decode([Users].self, from: data)
                workOutList = users!
                print("불러오나?\(workOutList)")
            }
            allDictionaries.removeAll()
            dateArr.removeAll()
            selectData.removeAll()
            workNameArr.removeAll()
            
            value()
            appenArr()
            

           tableListView.reloadData()
            
        
           
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            tableListView.reloadData()
            let userDefaults = UserDefaults.standard
            UserDefaults.standard.set(try? PropertyListEncoder().encode(workOutList), forKey:"workOutList")
            userDefaults.synchronize()  // 동기화



            
            tableListView.reloadData()
        }
        
        
        func appenArr(){
            for string in dateArr {
                if string.starts(with: selecteDate){
                    selectData.append(string)
                    print("selectDataArr\(selectData)")
                }
            }
            if workOutList.count == 0 {
            } else {
                for i in 0...dateArr.count - 1 {
                    if workOutList[i].date == selecteDate{
                        workNameArr.append(workOutList[i].workName!)
                        print("worknameArr  \(workNameArr)")
                    }
                }
            }
            tableListView.reloadData()
        }
        
    } //-----------------


