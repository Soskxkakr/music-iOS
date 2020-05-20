
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
    
    func validateUser(_ userData : Dictionary<String, AnyObject>,_ username : String,_ password : String) -> Bool {
        do {
            if ( userData["username"]!.isEqual(username) && userData["password"]!.isEqual(password) ) {
                return true
            } else {
                print("Error : Invalid Username and Password")
                return false
            }
        } catch let error {
            print("Error : " + error.localizedDescription)
        }
        
        return true
    }
    
}
