//
//  ViewController.swift
//  LifeCycle
//
//  Created by YOUNG on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfData: UITextField!

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){ // 넘기는 func
        let data : String = tfData.text!
        switch segue.identifier {
        case "segueVC" :
            if let vc = segue.destination as? SegueViewController {
                vc.result = data
            }
        case "navigation" :
            if let vc = segue.destination as? NavigationViewController{
                vc.result = data
            }
        default : fatalError()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("MainDEBUG : viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("MainDEBUG : viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("MainDEBUG : viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("MainDEBUG : viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("MainDEBUG : viewDidDisappear")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segue.identifier {
//        case "segue":
//            if let vc = segue.destination as? SegueViewController {
//                vc.lblData.text = tfData.text
//            }
//        case "navigation":
//            if let vc = segue.destination as? NavigationViewController {
//                vc.lblData.text = tfData.text
//            }
//        default:
//            fatalError()
//        }
    
    
    
    
}

