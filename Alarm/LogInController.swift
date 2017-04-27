
import UIKit
import FirebaseAuth

class LogInController: UIViewController {
    
    @IBOutlet weak var userTxt:UITextField!
    @IBOutlet weak var passTxt:UITextField!
    @IBOutlet weak var signInBtn:UIButton!
    @IBOutlet weak var forgotBtn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerKeyboard()
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LogInController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func signInClick(_ sender: Any) {
        
        let user = userTxt.text
        let password = passTxt.text
        let checkValidateEmail = Const().validateEmail(email: userTxt.text!)
        
        if checkValidateEmail == false
        {
            Const().showAlert(title: "Validation", message: "Email Error", viewController: self)
        }
        
        FIRAuth.auth()?.signIn(withEmail: user!, password: password!, completion: { (firebaseUser, firebaseError) in
            if firebaseError != nil
            {
                Const().showAlert(title: "SignIn", message: "Username or Password is in correct", viewController: self)
            }
            else
            {
                self.dismiss(animated: true, completion: nil)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func dismissKeyboard() { view.endEditing(true) }

    func registerKeyboard()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: self.view.window)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: self.view.window)
    }

    func keyboardWillHide(_ sender:NSNotification)
    {
        if userTxt.isEditing || passTxt.isEditing
        {
            if let userInfo = sender.userInfo
            {
                if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
                {
                    if self.view.frame.origin.y != 0
                    {
                        UIView.animate(withDuration: 0.15, animations: {
                            self.view.frame.origin.y += keyboardSize.height
                        })
                    }
                }
            }
        }
    }
    
    func keyboardWillShow(_ sender:NSNotification)
    {
        if userTxt.isEditing || passTxt.isEditing
        {
            if let userInfo = sender.userInfo
            {
                if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
                {
                    if self.view.frame.origin.y == 0
                    {
                        UIView.animate(withDuration: 0.15, animations: {
                            self.view.frame.origin.y -= keyboardSize.height
                        })
                    }
                }
            }
        }
    }

}
