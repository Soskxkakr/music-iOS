
import Foundation
import UIKit

class Song {
    
    var image : UIImage
    var title : String = ""
    var artist : String = ""
    var duration : String = ""
    
    init(_ image : UIImage,_ title : String,_ artist : String,_ duration : String) {
        self.image = image
        self.title = title
        self.artist = artist
        self.duration = duration
    }
    
}
