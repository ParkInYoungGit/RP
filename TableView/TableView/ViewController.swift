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
    var eventDate : [Date] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // data 불러오기
        if let data = UserDefaults.standard.value(forKey:"workOutList") as? Data {
            let users = try? PropertyListDecoder().decode([Users].self, from: data)
            workOutList = users!
        }
            
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
        selecteDate = dateFormatter.string(from: date)
        tableListView.reloadData()
        print(dateFormatter.string(from: date) + " 선택됨")
    }
    
    // 캘린더 setting
    func calendarSetup(){
        calendar.appearance.selectionColor = UIColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1)
        calendar.appearance.todayColor = UIColor(red: 188/255, green: 224/255, blue: 253/255, alpha: 1)
        calendar.scrollEnabled = true
        calendar.scrollDirection = .vertical
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        calendar.appearance.headerTitleColor = UIColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1
        )
        calendar.locale = Locale(identifier: "ko_KR")
    }

    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {

                if self.eventDate.contains(date){
                    return workOutList.count
                } ;return 0
    }
        
        
} //-----------------------------

    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        /// tableView에 cell을 만들 개수를 설정하는 프로토콜 메소드
        func tableView(_ tableView: UITableView,
                       numberOfRowsInSection section: Int) -> Int {
            if workOutList.count == 0 {
                return 0
            } else {
            for i in 0...workOutList.count {
                    if workOutList[i].date == selecteDate {
                        return workOutList.count
                }
                    return 0
                }

            }
            
            return workOutList.count
        }

        
        
        /// tableView에 cell 어떤 cell로 구성할지 설정하는 프로토콜 메소드
        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            
            // 외부에 UITableViewCell이 있는 경우
            // let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ExamTableViewCell

            // UITableview 내부에 있는 경우
           let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            
            let users: Users
            users = workOutList[indexPath.row]
            // cell에 데이터를 전달한다.
            // cell.textLabel?.text = "\(users.workName!) \(users.setNum!)세트 \(users.countNum!)회"
            cell.textLabel?.text = "\(users.workName!) \(users.setNum!)세트 \(users.countNum!)회"

            
            return cell
        }
        
        override func viewWillAppear(_ animated: Bool) {
            tableListView.reloadData()
            // data 불러오기
            if let data = UserDefaults.standard.value(forKey:"workOutList") as? Data {
                let users = try? PropertyListDecoder().decode([Users].self, from: data)
                workOutList = users!
            }
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            print("viewcontroller viewWillDissAppear")
            tableListView.reloadData()
            let userDefaults = UserDefaults.standard
            UserDefaults.standard.set(try? PropertyListEncoder().encode(workOutList), forKey:"workOutList")
            userDefaults.synchronize()  // 동기화
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                // Get the new view controller using segue.destination.
                // Pass the selected object to the new view controller.
                if segue.identifier == "sgDetail"{
                    let cell = sender as! UITableViewCell
                    let indexPath = self.tableListView.indexPath(for: cell) // 몇번째 인지 번호를 가져옴
                    let detailView = segue.destination as! DetailViewController // Detailview 잡고 (java의 new)
                    
                    let users: Users = workOutList[indexPath!.row]
                    
                    let workname = users.workName!
                    let setNum = users.setNum!
                    let countNum = users.countNum!
                    let date = users.date!
                    
                    detailView.receiveItems(workname, setNum, countNum, date)
                    detailView.selectedCell(Int(indexPath!.row)) // 몇번째인지 보내주는 함수
                }
            
        }
        
    } //-----------------


