//
//  TableViewController.swift
//  LifeCycle
//
//  Created by YOUNG on 2021/07/18.
//

import UIKit

var items : [String] = [String]()
var arrayCompleted: [Bool] = []
var completed: Bool = false

class TableViewController: UITableViewController, ListTableViewCellDelegate {
   
    func checkBoxToggle(sender: ListTableViewCell) {
        if let selectedIndexPath = tvListView.indexPath(for: sender){
            arrayCompleted[selectedIndexPath.row] = !arrayCompleted[selectedIndexPath.row]
            tvListView.reloadRows(at: [selectedIndexPath], with: .automatic)
            let userDefaults = UserDefaults.standard
            userDefaults.set(arrayCompleted, forKey: "check") // 키, value 설정
            userDefaults.synchronize()  // 동기화
        }
    }
    

    @IBOutlet var tvListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
        let data = UserDefaults.standard
        let myarray = data.stringArray(forKey: "items") ?? [String]()
    
        items = myarray
        print("myarray:\(items)")
        
        //UserDefaults.standard.removeObject(forKey: "items")
        
        let checkMark = UserDefaults.standard
        let checkArray = checkMark.array(forKey: "check")as? [Bool] ?? [Bool]()
        arrayCompleted = checkArray
        print("checkArray\(arrayCompleted)")

        
        tvListView.delegate = self
    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ListTableViewCell
        cell.delegate = self

        // Configure the cell...
        cell.nameLabel.text = items[(indexPath as NSIndexPath).row]
        cell.checkBoxButton.isSelected = arrayCompleted[indexPath.row]
        //cell.checkBoxButton.addTarget(self, action: #selector(celldidtab), for: .touchUpInside)
        
        return cell
    }
    
    @objc
    func celldidtab () {
        
    }


    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
        let userDefaults = UserDefaults.standard
        userDefaults.set(items, forKey: "items") // 키, value 설정
        userDefaults.set(arrayCompleted, forKey: "check")
        userDefaults.synchronize()  // 동기화
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tvListView.reloadData()
        let userDefaults = UserDefaults.standard
        userDefaults.set(items, forKey: "items") // 키, value 설정
        userDefaults.set(arrayCompleted, forKey: "check")
        userDefaults.synchronize()  // 동기화
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            arrayCompleted.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        
        let checkToMove = arrayCompleted[(fromIndexPath as NSIndexPath).row]
        arrayCompleted.remove(at: (fromIndexPath as NSIndexPath).row)
        arrayCompleted.insert(checkToMove, at: (to as NSIndexPath).row)

    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell) // 몇번째 인지 번호를 가져옴
            let detailView = segue.destination as! DetailViewController // Detailview 잡고 (java의 new)
            // detailView.receiveItem = items[(indexPath! as NSIndexPath).row]
            
            detailView.receiveItems(items[(indexPath! as NSIndexPath).row]) // 연결된 아이 함수 실행
            detailView.selectedCell(Int(indexPath!.row)) // 몇번째인지 보내주는 함수
        }
    }

    

    
}
