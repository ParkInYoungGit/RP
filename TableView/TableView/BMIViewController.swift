//
//  BMIViewController.swift
//  TableView
//
//  Created by YOUNG on 2021/07/28.
//

import UIKit


class BMIViewController: UIViewController {
    
    
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var hSlider: UISlider!
    @IBOutlet weak var wSlider: UISlider!
    @IBOutlet weak var segmented: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        hSlider.value = 170
        wSlider.value = 60
        tfHeight.text = String(Int(hSlider.value))
        tfWeight.text = String(Int(wSlider.value))
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segGender(_ sender: UISegmentedControl) {
        if segmented.selectedSegmentIndex == 0 {
            hSlider.value = 170
            wSlider.value = 60
            tfHeight.text = String(Int(hSlider.value))
            tfWeight.text = String(Int(wSlider.value))
        } else {
            hSlider.value = 160
            wSlider.value = 50
            tfHeight.text = String(Int(hSlider.value))
            tfWeight.text = String(Int(wSlider.value))
        }
    }
    
    @IBAction func btnBmi(_ sender: Any) {
        
        
        let sendHeight = tfHeight.text!
        let sendWeight = tfWeight.text!

        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "resultVC") as? resultViewController else { return }
        resultVC.resultheight = Double(sendHeight)!
        resultVC.resultweight = Double(sendWeight)!
        self.navigationController?.pushViewController(resultVC, animated: true)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func changeHeight(_ sender: UISlider) {
        tfHeight.text = String(Int(hSlider.value))
    }
    
    @IBAction func changeWeight(_ sender: UISlider) {
        tfWeight.text = String(Int(wSlider.value))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
