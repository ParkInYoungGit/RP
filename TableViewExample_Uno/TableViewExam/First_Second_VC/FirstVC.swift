//
//  FirstVC.swift
//  TableViewExam
//
//  Created by 김우성 on 2021/07/03.
//

import UIKit

class FirstVC: UIViewController {
    
    //MARK: - Prperty
    /// "SecondVC"에서 UITextField에서 입력 받은 텍스트를 입력받을 UILabel
    @IBOutlet weak var titleLabel: UILabel!
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    
    //MARK: - Action
    /// button을 클릭하면 호출될 콜백메소드
    @IBAction func buttonDidTap(_ sender: Any) {
        
        // 다음 컨트롤러로 넘어가기 위해 Controller 인스턴스를 생성한다.
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        
        // 다음 컨트롤러의 Delegate 가 "FirstVC"(현재Controller) 임을 나타낸다.
        // 이로인해, "SecondVC"에서 메소드가 호출되면, 그 로직을 "FristVC"에서 처리한다.
        vc.delegate = self
        
        // 다음화면으로 넘어간다.
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: - Helper
    
    /// 최초 화면 구성 시, 구현할 Layout 메소드
    private func setupLayout() {
        
        view.backgroundColor = .white
    }
}

//MARK: - SecondVCDelegate
// SecondVC에서 delegate 메소드를 호출하면, 아래 로직이 실행된다.
extension FirstVC: SecondVCDelegate {
    
    func secondVCPassDataToFirstVC(text: String?) {
        // 메소드의 파라미터로 있는 "text"(바로위에) 는 SecondVC에 있는 UITextField에서 타이핑한 String? 데이터
        
        // "self.titleLabel"은 "FirstVC"에 있는 UILabel
        self.titleLabel.text = text
    }
}
