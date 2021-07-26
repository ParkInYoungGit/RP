//
//  TableViewController.swift
//  TableView
//
//  Created by YOUNG on 2021/07/24.
//

import UIKit


class TableViewController: UITableViewController {
    
    
   
    @IBOutlet var tvlistView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        tvlistView.delegate = self
        
        if let data = UserDefaults.standard.value(forKey:"workOutList") as? Data {
            let users = try? PropertyListDecoder().decode([Users].self, from: data)
            workOutList = users!
            print(users)
        }
               
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return workOutList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        // Configure the cell...
        let users: Users
        users = workOutList[(indexPath as NSIndexPath).row]
        
        cell.textLabel!.text = "\(users.workName!) \(users.setNum!)세트 \(users.countNum!)회"
        cell.detailTextLabel?.text = users.date
        
        
        
        return cell
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
            workOutList.remove(at: (indexPath as NSIndexPath).row)
            //tvlistView.deleteRows(at: [indexPath], with: .fade)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvlistView.reloadData()
        let userDefaults = UserDefaults.standard
        UserDefaults.standard.set(try? PropertyListEncoder().encode(workOutList), forKey:"workOutList")
        userDefaults.synchronize()
        print("tableview : viewWillApeear")
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        tvlistView.reloadData()
        let userDefaults = UserDefaults.standard
        UserDefaults.standard.set(try? PropertyListEncoder().encode(workOutList), forKey:"workOutList")
        userDefaults.synchronize()  // 동기화
        print("tableview : viewWillDisApeear")
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "sgDetail", sender: self)
//
//    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
        print("prepare")
            if segue.identifier == "sgDetail"{
                let cell = sender as! UITableViewCell
                let indexPath = self.tvlistView.indexPath(for: cell) // 몇번째 인지 번호를 가져옴
                let detailView = segue.destination as! DetailViewController // Detailview 잡고 (java의 new)
                
                let users: Users = workOutList[indexPath!.row]
                
                let workname = users.workName!
                let setNum = users.setNum!
                let countNum = users.countNum!
                let date = users.date!
                
                detailView.receiveItems(workname, setNum, countNum, date)
                detailView.selectedCell(Int(indexPath!.row)) // 몇번째인지 보내주는 함수
            }
        
    }
    
    
    
}
