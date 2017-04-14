//
//  MyClassTableViewController.swift
//  Alarm
//
//  Created by Siwat Charoensong on 4/4/2560 BE.
//  Copyright © 2560 Siwat Charoensong. All rights reserved.
//

import UIKit
import FirebaseAuth

class MyClassTableViewController: UITableViewController{
    
    @IBOutlet weak var classTableView: UITableView!
    
    func logout()
    {
        do
        {
            try FIRAuth.auth()?.signOut()
        }
        catch let error as NSError
        {
            print(error.localizedDescription)
        }
        
        if FIRAuth.auth()?.currentUser == nil
        {
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LogInStoryboard") as! LogInController
            self.present(loginVC, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if FIRAuth.auth()?.currentUser == nil
        {
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LogInStoryboard") as! LogInController
            self.present(loginVC, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier:"headerCell") as! HeaderTableViewCell
        cell.signOutBtn.tag = indexPath.row
        cell.currentDateTime()
        cell.signOutBtn.addTarget(self, action: "logout", for: .touchUpInside)
        
        return cell
    }
    
    


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
