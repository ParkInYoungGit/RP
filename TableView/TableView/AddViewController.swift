//
//  AddViewController.swift
//  TableView
//
//  Created by YOUNG on 2021/07/23.
//

import UIKit
//var workOutList = [Users]()

class AddViewController: UIViewController {
    
    let firstVC = FirstViewController()
    let secondVC = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
         setup()
    }
    
    private func setup(){
        addChild(firstVC)
        addChild(secondVC)

        self.view.addSubview(firstVC.view)
        self.view.addSubview(secondVC.view)

        firstVC.didMove(toParent: self)
        secondVC.didMove(toParent: self)

        firstVC.view.frame = self.view.bounds
        secondVC.view.frame = self.view.bounds
        secondVC.view.isHidden = true
    }

    @IBAction func switchViews(_ sender: UISegmentedControl) {
        firstVC.view.isHidden = true
        secondVC.view.isHidden = true
        if sender.selectedSegmentIndex == 0 {
            firstVC.view.isHidden = false
        } else {
            secondVC.view.isHidden = false
        }
    }
    
    @IBAction func btnInsert(_ sender: UIBarButtonItem) {
        
        
        let workName = firstVC.tfWorkName.text!
        let setNum = firstVC.tfSetNum.text!
        let countNum = firstVC.tfCountNum.text!
        
        let date = DateFormatter()
        date.locale = Locale(identifier: "ko")
        date.dateFormat = "yyyy-MM-dd"
        let currentDate = date.string(from: Date())
        
        workOutList.append(Users(workName: workName, countNum: Int(countNum), setNum: Int(setNum), date: currentDate))

        print("addview\(workOutList)")

 
        
        let checkAlert = UIAlertController(title: "확인", message: "입력이 완료 되었습니다!", preferredStyle: UIAlertController.Style.alert)
        let onAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: { (action) in    self.navigationController?.popViewController(animated: true)
            })
        checkAlert.addAction(onAction)
            self.present(checkAlert, animated: true, completion: nil)
        
        firstVC.tfWorkName.text = ""
        firstVC.tfSetNum.text = ""
        firstVC.tfCountNum.text = ""
   
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // nil check function
        func checkNil(str: String!) -> Int {
            let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
            if check.isEmpty{
                return 0
            }else{
                return 1
            }
        }
    
    
}
