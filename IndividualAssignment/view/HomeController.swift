
import UIKit

class HomeController: UIViewController {

    var receivedName : String = ""
    
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = "Welcome, "+receivedName
    }
    
    
    @IBAction func logout(_ sender: UIButton) {
        
    }
}
