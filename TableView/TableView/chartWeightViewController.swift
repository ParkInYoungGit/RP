//
//  chartWeightViewController.swift
//  TableView
//
//  Created by YOUNG on 2021/07/29.
//

import UIKit

class chartWeightViewController: UIViewController {

    var weight: String = ""
    @IBOutlet weak var tfWeight: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        


        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.destination is chartViewController{
            let date = DateFormatter()
            date.locale = Locale(identifier: "ko")
            date.dateFormat = "dd"
            let currentDate = date.string(from: Date())
            
            let vc = segue.destination as? chartViewController
            weight = tfWeight.text!
            recWeight.append(Int(weight) ?? 0)
            months.append(currentDate)
            print("btninsert\(weight)")
            print("btninsert\(currentDate)")
        
            print("btninsert\(recWeight)")
            print("btninsert\(months)")
            
            let defaults = UserDefaults.standard
            defaults.set(months, forKey: "months")
            
            let defaults1 = UserDefaults.standard
            defaults1.set(recWeight, forKey: "weight")

            defaults.synchronize()
            defaults1.synchronize()
        }
    }
    
//    @IBAction func btnInsert(_ sender: Any) {
//        let date = DateFormatter()
//        date.locale = Locale(identifier: "ko")
//        date.dateFormat = "MM"
//        let currentDate = date.string(from: Date())
//        
//        recWeight.append(Int(weight) ?? 0)
//        months.append(currentDate)
//        
//        let defaults = UserDefaults.standard
//        defaults.set(months, forKey: "months")
//        
//        let defaults1 = UserDefaults.standard
//        defaults1.set(recWeight, forKey: "weight")
//
//        print("btninsert\(recWeight)")
//        print("btninsert\(months)")
//
//        
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
