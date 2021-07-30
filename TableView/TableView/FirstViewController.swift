//
//  FirstViewController.swift
//  TableView
//
//  Created by YOUNG on 2021/07/23.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tfWorkName: UITextField!
    @IBOutlet weak var tfSetNum: UITextField!
    @IBOutlet weak var tfCountNum: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
