
import UIKit
import FirebaseAuth
import Firebase
import SwiftyJSON


class MyClassViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var signOutBtn:UIButton!
    @IBOutlet weak var subjectTableView:UITableView!
    
    var jsonData:[JSON] = []
    var snapshopKey:[String] = []
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
        return jsonData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = subjectTableView.dequeueReusableCell(withIdentifier: "subjectCell") as! SubjectTableViewCell
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setDataValue(user:String) {
        let set:Set<Character> = Set("qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM".characters)
        let userFormate = String(user.characters.filter{set.contains($0)})
        
        dataReference = FIRDatabase.database().reference()
        _dataHandle  = self.dataReference.child("teacher/"+userFormate).observe(.childAdded, with: { (firebaseSnap) in
            
            self.snapshopKey.append(firebaseSnap.key)
            let snapData = firebaseSnap.value as? [String:AnyObject]
            self.jsonData.append(JSON(snapData as Any))
            
            let indexPathRow = IndexPath(row: self.jsonData.count-1, section: 0)
            self.subjectTableView.insertRows(at: [indexPathRow], with: .automatic)
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
