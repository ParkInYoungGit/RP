//
//  SecondVC.swift
//  TableViewExam
//
//  Created by 김우성 on 2021/07/03.
//

import UIKit

// 1 두 번째 화면에서 프로토콜을 만든다.
protocol SecondVCDelegate: AnyObject {
    
    // 2 원하는 메소드를 만든다.
    func secondVCPassDataToFirstVC(text: String?)
}



class SecondVC: UIViewController {
    
    // 3 프로토콜을 따르는 변수를 생성한다.
    weak var delegate: SecondVCDelegate?

    //MARK: - Prperty
    
    @IBOutlet weak var textField: UITextField!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    //MARK: - Action
    
    /// UITextField에서 데이터가 변경되면 호출되는 콜백 메소드
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        
        print("DEBUG>> \(textField.text) ")
    }
    
    /// 버튼을 클릭하면 호출되는 콜백메소드
    @IBAction func buttonDidTap(_ sender: Any) {
                
        /// 프로토콜에 있는 메소드를 호출한다. 호출 할 때, 현재 텍스트필드에 입력된 값을 할당한다.
        delegate?.secondVCPassDataToFirstVC(text: textField.text)
        
        /// 현재 Controller를 메모리에서 해제한다.
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helper
    
    private func setupLayout() {
        
        view.backgroundColor = .white
    }
}
