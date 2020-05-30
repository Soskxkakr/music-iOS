
import Foundation
import UIKit

class Song {
    
    var image : UIImage
    var title : String = ""
    var artist : String = ""
    var duration : String = ""
    
    // Improved attributes from json
    var songDetails : Dictionary<String, AnyObject> = [:]
    
    init() {
        self.image = UIImage()
    }
    
    init(_ songDetails : Dictionary<String, AnyObject>) {
        self.image = UIImage()
        self.title = ""
        self.duration = ""
        self.songDetails = songDetails
    }
    
    init(_ image : UIImage,_ title : String,_ artist : String,_ duration : String) {
        self.image = image
        self.title = title
        self.artist = artist
        self.duration = duration
    }
    
    func getSongDetails() -> Dictionary<String, AnyObject> {
        return self.songDetails
    }
}
