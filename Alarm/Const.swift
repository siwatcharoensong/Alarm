
import Foundation
import UIKit

class Const
{
    func validateEmail(email:String) -> Bool
    {
        let fmtText = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailCheck = NSPredicate(format: "SELF MATCHES %@",fmtText)
        
        return emailCheck.evaluate(with: email)
    }
    
    func showAlert(title:String, message:String, viewController:UIViewController)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let resultAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(resultAlert)
        viewController.present(alert, animated: true, completion: nil)
    }
}
