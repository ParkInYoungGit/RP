//
//  DetailViewController.swift
//  TableView
//
//  Created by YOUNG on 2021/07/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem: [Users] = []
    
    @IBOutlet weak var tfCount: UITextField!
    @IBOutlet weak var tfWorkout: UITextField!
    @IBOutlet weak var tfSet: UITextField!
    
    var cellNum = 0
    var receiveName = ""
    var receiveCount = 0
    var receiveSet = 0
    var receiveDate = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfCount.text = String(receiveCount)
        tfWorkout.text = receiveName
        tfSet.text = String(receiveSet)
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnUpdate(_ sender: UIBarButtonItem) {
        
        let workName = tfWorkout.text
        let setNum = tfSet.text
        let countNum = tfCount.text
        
        workOutList[cellNum] = Users(workName: workName, countNum: Int(countNum!), setNum: Int(setNum!), date: receiveDate)
        
        
        let checkAlert = UIAlertController(title: "확인", message: "수정이 완료 되었습니다!", preferredStyle: UIAlertController.Style.alert)
        let onAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: { (action) in    self.navigationController?.popViewController(animated: true)
            })
        checkAlert.addAction(onAction)
            self.present(checkAlert, animated: true, completion: nil) // alert을 화면에 띄워준다.
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func selectedCell(_ num: Int) {
        cellNum = num
    }
    

    func receiveItems (_ name: String, _ count: Int, _ set: Int, _ date: String){
        receiveName = name
        receiveCount = count
        receiveSet = set
        receiveDate = date
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
