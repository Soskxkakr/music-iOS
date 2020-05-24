//
//  MusicCell.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 24/05/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import UIKit

class MusicCell: UITableViewCell {
    
    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var musicArtist: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    func setMusic(music : Song) {
        musicImageView.image = music.image
        musicTitle.text = music.title
        musicArtist.text = music.artist
        duration.text = music.duration
    }
}
