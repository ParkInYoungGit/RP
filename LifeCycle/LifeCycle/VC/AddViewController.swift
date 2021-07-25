//
//  AddViewController.swift
//  LifeCycle
//
//  Created by YOUNG on 2021/07/17.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var txtAddItem: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
/*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnDone(_ sender: UIBarButtonItem) {
        items.append(txtAddItem.text!)
        arrayCompleted.append(false)
        txtAddItem.text = ""
        navigationController?.popViewController(animated: true)
        print("\(arrayCompleted)")
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        items.append(txtAddItem.text!)
//        arrayCompleted.append(false)
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(items, forKey: "items") // 키, value 설정
//        userDefaults.set(arrayCompleted, forKey: "check")
//        userDefaults.synchronize()  // 동기화
//        txtAddItem.text = ""
//        navigationController?.popViewController(animated: true)
//
//    }
}
