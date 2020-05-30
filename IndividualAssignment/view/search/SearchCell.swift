//
//  SearchCell.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 30/05/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    func setMusic(music: Song) {
        // Make image round
        musicImage.layer.cornerRadius = musicImage.frame.size.width/2
        musicImage.clipsToBounds = true
        
        // Create the view of the Music Cell
        musicImage.image = music.image
        title.text = music.title
        artist.text = music.artist
        duration.text = music.duration
    }
}
