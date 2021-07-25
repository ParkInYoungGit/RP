//
//  SegueViewController.swift
//  LifeCycle
//
//  Created by YOUNG on 2021/07/16.
//

import UIKit

class SegueViewController: UIViewController {
    @IBOutlet weak var lblData: UILabel!
    var result: String? = "DEFAULT"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("SegueDEBUG : viewDidLoad")
        lblData.text = result
    }

    override func viewWillAppear(_ animated: Bool) {
        print("SegueDEBUG : viewWillAppear")
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("SegueDEBUG : viewDidAppear")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("SegueDEBUG : viewWillDisappear")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("SegueDEBUG : viewDidDisappear")
       
    }
        
}
