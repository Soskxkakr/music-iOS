
import Foundation

class FileController {
    
    func readFile(_ filePath : String) -> Dictionary<String, AnyObject> {
        // Open JSON File and Read
        do {
            let fileURL = Bundle.main.path(forResource: filePath, ofType: "json") // User.json
            let data = try Data(contentsOf : URL(fileURLWithPath : fileURL!), options : .mappedIfSafe)
            let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            let userData = jsonObj as? Dictionary<String, AnyObject>
            return userData!
        } catch {
            print("error : "+error.localizedDescription)
        }
        return [:]
    }
    
    func writeFile(_ jsonString : String) -> Bool {
//        do {
//            try! jsonString.w
//        } catch {
//            print(error.localizedDescription)
//        }
        return true
    }
    
    func clearFile() -> Bool {
        // Erase all data inside a file
        return true
    }
}
