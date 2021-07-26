//
//  Add2ViewController.swift
//  TableView
//
//  Created by 안병욱 on 2021/07/26.
//

import UIKit
var workOutList = [Users]()

class Add2ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var setNum: String = ""
    var countNum: String = ""
    var workOutName: String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numberArr[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        setNum = String(numberArr[row])
        countNum = String(numberArr[row])
    }
    
    func numberOfComponents2(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func createPickerView() {
        let setpickerView = UIPickerView()
        setpickerView.delegate = self
        tfsetNum.inputView = setpickerView
        
        let countpickerView = UIPickerView()
        countpickerView.delegate = self
        tfCountNum.inputView = countpickerView
    }

    
    func dismissPickerView() {
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
        let btnDone = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(onPickDone))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let btnCancel = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(onPickCancel))
            toolBar.setItems([btnCancel, space, btnDone], animated: true)
            toolBar.isUserInteractionEnabled = true
            tfsetNum.inputAccessoryView = toolBar
        
    }
    
    func dismissCountPickerView() {
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
        let btnDone = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(onPickDoneCount))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let btnCancel = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(onPickCancelCount))
            toolBar.setItems([btnCancel, space, btnDone], animated: true)
            toolBar.isUserInteractionEnabled = true
            tfCountNum.inputAccessoryView = toolBar
    }
    
    @objc func onPickDoneCount(){
        tfCountNum.text = countNum
        tfCountNum.resignFirstResponder()
        countNum = ""
    }
    
    @objc func onPickCancelCount(){
        tfCountNum.resignFirstResponder()
        countNum = ""
    }
    
    
    @objc func onPickDone(){
        tfsetNum.text = setNum
        tfsetNum.resignFirstResponder()
        setNum = ""
    }
    
    @objc func onPickCancel(){
        tfsetNum.resignFirstResponder()
        setNum = ""
    }
    
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfsetNum: UITextField!
    @IBOutlet weak var tfCountNum: UITextField!
    var numberArr: [Int] = [Int]()
    var WorkOutArr: [String] = ["스쿼트", "런지", "데드리프트", "팔굽혀펴기", "점핑잭", "달리기", "걷기", "턱걸이", "플랭크", "마운틴클라이머"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...100{
            numberArr.append(i)
        }
        
        createPickerView()
        dismissPickerView()
        dismissCountPickerView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnInsert(_ sender: UIBarButtonItem) {
        let workName = tfName.text!
        let setNum = tfsetNum.text!
        let countNum = tfCountNum.text!
        
        let date = DateFormatter()
        date.locale = Locale(identifier: "ko")
        date.dateFormat = "yyyy-MM-dd"
        let currentDate = date.string(from: Date())
        
        workOutList.append(Users(workName: workName, countNum: Int(countNum), setNum: Int(setNum), date: currentDate))

        let checkAlert = UIAlertController(title: "확인", message: "입력이 완료 되었습니다!", preferredStyle: UIAlertController.Style.alert)
        let onAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: { (action) in    self.navigationController?.popViewController(animated: true)
            })
        checkAlert.addAction(onAction)
            self.present(checkAlert, animated: true, completion: nil)
        
        tfName.text = ""
        tfCountNum.text = ""
        tfsetNum.text = ""
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
