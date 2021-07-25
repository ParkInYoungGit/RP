//
//  NavigationViewController.swift
//  LifeCycle
//
//  Created by YOUNG on 2021/07/16.
//

import UIKit

class NavigationViewController: UIViewController {

    @IBOutlet weak var lblData: UILabel!
    var result: String? = "DEFAULT"
    override func viewDidLoad() {
        super.viewDidLoad()

        print("NavigationDEBUG : viewDidLoad")
        lblData.text = result
    }

    override func viewWillAppear(_ animated: Bool) {
        print("NavigationDEBUG : viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("NavigationDEBUG : viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("NavigationDEBUG : viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("NavigationDEBUG : viewDidDisappear")
    }


}
