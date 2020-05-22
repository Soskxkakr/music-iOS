
import UIKit

class ViewController: UIViewController {
    
    var username : String = ""
    var password : String = ""
    var userData : Dictionary<String, AnyObject> = [:]
    var user = User()
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func login(_ sender: UIButton) {
        do {
            if ( usernameField.text != "" && passwordField.text != "" ) {
                
                self.userData = FileController().readFile("User")
                let lv = LoginValidation.init(self.usernameField.text!, self.passwordField.text!)
                
                if ( lv.validateUser(self.userData) == true ) {
                    user = User.init( String(describing : self.userData["name"]!),
                               String(describing : self.userData["email"]!),
                               String(describing : self.userData["contact_no"]!))
                    performSegue(withIdentifier: "pass", sender: self) // Go to HomeController ( Home Page )
                } else {
                    let popupMsg = UIAlertController(title: "Error", message: "Invalid Username and Password", preferredStyle: .alert)
                    let okBtn = UIAlertAction(title: "OK", style: .default, handler: {
                        (action) -> Void in
                    })
                    popupMsg.addAction(okBtn)
                    present(popupMsg, animated: true, completion: nil)
                }
            } else {
                let popupMsg = UIAlertController(title: "Error", message: "Invalid Username and Password", preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "OK", style: .default, handler: {
                    (action) -> Void in
                })
                popupMsg.addAction(okBtn)
                present(popupMsg, animated: true, completion: nil)
            }
        } catch let error {
            print("Error : " + error.localizedDescription)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pass" {
            let homePage = segue.destination as! HomeController
            homePage.receivedName = user.getName()
        }
    }
    
}

