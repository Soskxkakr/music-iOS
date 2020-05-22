
import UIKit

class HomeController: UIViewController {

    var receivedName : String = ""
    
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = "Welcome, "+receivedName
    }
    
    
    @IBAction func logout(_ sender: UIButton) {
        let popupMsg = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
        let yesBtn = UIAlertAction(title: "YES", style: .default, handler: { action in
            self.performSegue(withIdentifier: "back", sender: self)
        })
        let noBtn = UIAlertAction(title: "NO", style: .default, handler: {
            (action) -> Void in
        })
        popupMsg.addAction(yesBtn)
        popupMsg.addAction(noBtn)
        present(popupMsg, animated: true, completion: nil)
    }
}
