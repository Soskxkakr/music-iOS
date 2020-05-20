
import Foundation

class LoginValidation {
    
    var username : String = ""
    var password : String = ""
    
    init(_ username : String, _ password : String) {
        self.username = username
        self.password = password
        
        // Open File, Serialize it, Get the data
        // Loop the data and check for each username and password
    }
    
    func validateUser(_ userData : Dictionary<String, AnyObject>) -> Bool {
        do {
            if ( userData["username"]!.isEqual(self.username) && userData["password"]!.isEqual(self.password) ) {
                return true
            } else {
                print("Error : Invalid Username and Password")
                return false
            }
        } catch let error {
            print("Error : " + error.localizedDescription)
        }
    }
    
}
