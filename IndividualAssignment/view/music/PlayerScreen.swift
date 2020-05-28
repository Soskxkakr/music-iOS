//
//  PlayerScreen.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 27/05/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import UIKit

class PlayerScreen: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songArtist: UILabel!
    
    var mySong = Song()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make image round
        image.layer.cornerRadius = image.frame.size.width/2
        image.clipsToBounds = true
        
        self.image.image = mySong.image
        self.songTitle.text = mySong.title
        self.songArtist.text = mySong.artist
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        
    }
}
