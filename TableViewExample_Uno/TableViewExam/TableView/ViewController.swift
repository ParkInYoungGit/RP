/*
 To. RC_1기 iOS
 
 [UITableView]
 테이블 뷰에 사용된 개념)
 - Delegation
 - Protocol

 /* 테이블 뷰 작성 방법 */
 1. "Data" 를 가져온다. (Array를 이용한다.)
 2. "UITableView" 를 생성한다.
 3. "UITableViewCell" 을 생성한다. 
 4. "UITableViewCell"을 tableView에 등록한다. 
    (UITableViewCell 내부에 바로 작성하는 방법 vs UITableViewCell.swift를 따로 만드는 방법)
 5. "UITableViewDelegate", "UITableViewDataSource" 를 채택한다.
 6. 프로토콜에서 반드시 구현해야하는 메소드를 구현한다.
    (tableView(...numberOfRowAt) / tableView(...cellForRowAt)
 
 (아래 있는 숫자와 1:1 매칭은 되지 않습니다. 그냥 작성 순서를 적었습니다.)
 */

import UIKit

class ViewController: UIViewController {

    // 2) UI를 구성한다.
    @IBOutlet weak var tableView: UITableView!
    var selected: [Int] = []
    
    // 1) 데이터를 가져온다.
    let dataArr = ["에어플레인 모드", "Wi-Fi", "Bluetooth", "셀룰러", "개인용 핫스팟",
    "알림", "사운드 및 햅틱" , "방해금지 모드", "스크린 타임", "일반", "제어 센터", "디스플레이 및 밝기", "홈화면", "손쉬운 사용",
    "배경화면", "Siri 및 rjator","에어플레인 모드", "Wi-Fi", "Bluetooth", "셀룰러", "개인용 핫스팟",
    "알림", "사운드 및 햅틱" , "방해금지 모드", "스크린 타임", "일반", "제어 센터", "디스플레이 및 밝기", "홈화면", "손쉬운 사용",
    "배경화면", "Siri 및 rjator","에어플레인 모드", "Wi-Fi", "Bluetooth", "셀룰러", "개인용 핫스팟",
    "알림", "사운드 및 햅틱" , "방해금지 모드", "스크린 타임", "일반", "제어 센터", "디스플레이 및 밝기", "홈화면", "손쉬운 사용",
    "배경화면", "Siri 및 rjator","에어플레인 모드", "Wi-Fi", "Bluetooth", "셀룰러", "개인용 핫스팟",
    "알림", "사운드 및 햅틱" , "방해금지 모드", "스크린 타임", "일반", "제어 센터", "디스플레이 및 밝기", "홈화면", "손쉬운 사용",
    "배경화면", "Siri 및 rjator","에어플레인 모드", "Wi-Fi", "Bluetooth", "셀룰러", "개인용 핫스팟",
    "알림", "사운드 및 햅틱" , "방해금지 모드", "스크린 타임", "일반", "제어 센터", "디스플레이 및 밝기", "홈화면", "손쉬운 사용",
    "배경화면", "Siri 및 rjator"]

    private let testLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selected = Array<Int>(repeating: 0, count: dataArr.count)
        
        // 3) tableView Delegate와 DataSource를 채택한다.
        /* (아래 Extension을 통해 두 개의 프로토콜을 채택한다.)
        "Extension"은 ViewController의 코드블럭을 나누는 방법으로
         보통 Delegate를 통해 기능을 추가한 경우 가독성을 위해서 나눕니다. (필수사항X)
         */
        // Delegate = self -> 제스쳐, UI
        tableView.delegate = self
        
        // DataSource = self -> 데이터관리
        tableView.dataSource = self
        
        // 4) tableViewcell을 등록한다. (따로 UITableviewCell 파일을 만든 경우 등록해야한다.) 
        tableView.register(UINib(nibName: "ExamTableViewCell", bundle: nil), forCellReuseIdentifier: "ExamCell")
    }
}


//MARK: - UITableViewDelegate, UITableViewDataSource
// 5) protocol 메소드를 구현한다.
extension ViewController: UITableViewDelegate, UITableViewDataSource,  ExamTableCellDelegate {

    

    
    
    /// tableView에 cell을 만들 개수를 설정하는 프로토콜 메소드
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        dataArr.count
    }
    
    

    /// tableView에 cell 어떤 cell로 구성할지 설정하는 프로토콜 메소드
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // 외부에 UITableViewCell이 있는 경우
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExamCell", for: indexPath) as! ExamTableViewCell
        cell.delegate = self
        
        // UITableview 내부에 있는 경우
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        // cell에 데이터를 전달한다.
        cell.titleLabel.text = dataArr[indexPath.row]
        cell.index = indexPath.row
        
        
        if selected[indexPath.row] == 1 {
            cell.customSwitch.isOn = true
        } else {
            cell.customSwitch.isOn = false
        }
        
        return cell
    }
    
    func didSelect(for index: Int, select: Bool) {
        if select == true{
            selected[index] = 1
        } else {
            selected[index] = 0
        }
    }

}


