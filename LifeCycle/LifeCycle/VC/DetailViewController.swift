//
//  DetailViewController.swift
//  LifeCycle
//
//  Created by YOUNG on 2021/07/19.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var txtItem: UITextField!
    var receiveItem = ""
    var cellNum = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtItem.text = receiveItem
    }
    
   
    @IBAction func btnDone(_ sender: UIBarButtonItem) {
        items[cellNum] = txtItem.text!
        navigationController?.popViewController(animated: true)
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func receiveItems(_ item: String){
        receiveItem = item
    }
    
    func selectedCell(_ num: Int) {
        cellNum = num
    }
}
