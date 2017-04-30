
import UIKit
import FirebaseAuth
import Firebase
import SwiftyJSON


class MyClassViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var signOutBtn:UIButton!
    @IBOutlet weak var subjectTableView:UITableView!
    
    
    var snapshopKey = [dataControl]()
    var dataReference:FIRDatabaseReference!
    private var _dataHandle:FIRDatabaseHandle! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectTableView.dataSource = self
        subjectTableView.delegate = self
        
        if FIRAuth.auth()?.currentUser == nil
        {
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LogInStoryboard") as! LogInController
            self.present(loginVC, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDataValue(user: "siwatchahotmailcom")

    }
    
    @IBAction func signOutBtnClick(_ sender:AnyObject)
    {
        logout()
        if FIRAuth.auth()?.currentUser == nil
        {
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LogInStoryboard") as! LogInController
            self.present(loginVC, animated: true, completion: nil)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.snapshopKey.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = subjectTableView.dequeueReusableCell(withIdentifier: "subjectCell") as! SubjectTableViewCell
        let data = snapshopKey[indexPath.row]
        cell.dataSetSubject(dataControl: data)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setDataValue(user:String) {
        let set:Set<Character> = Set("qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM".characters)
        let userFormate = String(user.characters.filter{set.contains($0)})
        
        dataReference = FIRDatabase.database().reference()
        _dataHandle  = self.dataReference.child("teacher/"+userFormate).observe(.value , with: { (firebaseSnap) in
            
            let snapShot = firebaseSnap.children.allObjects as? [FIRDataSnapshot]
            print(snapShot)
            for snap in snapShot!
            {
                let snapData = snap.value as? Dictionary <String, AnyObject>
                let key = snap.key
                let data = dataControl(majorKey: key, dictionary: snapData!)
                self.snapshopKey.append(data)
            }
           self.subjectTableView.reloadData()
        })
    }
    
    func RelDataValue(user:String){
        let set:Set<Character> = Set("qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM".characters)
        let userFormate = String(user.characters.filter{set.contains($0)})
        
        if _dataHandle != nil
        {
            self.dataReference.child(userFormate).removeObserver(withHandle: _dataHandle)
            _dataHandle = nil
        }
    }

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
    }

}
