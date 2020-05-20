import Foundation

class User {
    
    var id : String
    var name : String
    
    init() {
        self.id = UUID().uuidString // Generate a random ID
        self.name = "John Doe"
    }
    
    init(_ name : String) {
        self.id = UUID().uuidString
        self.name = name
    }
}
