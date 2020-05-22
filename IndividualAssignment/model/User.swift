import Foundation

class User {
    
    private var id : String = ""
    private var name : String = ""
    private var email : String = ""
    private var contactNo : String = ""
    
    init() {
        // Do Nothing
    }
    
    init(_ name : String,_ email : String,_ contactNo : String) {
        self.id = UUID().uuidString
        self.name = name
        self.email = email
        self.contactNo = contactNo
    }
    
    // Getters
    func getName() -> String {
        return self.name
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    func getContactNo() -> String {
        return self.contactNo
    }
}
