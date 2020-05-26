//
//  MusicListScreen.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 24/05/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import UIKit

class MusicListScreen: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var musics : [Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musics = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func createArray() -> [Song] {
        
        var tempSongs : [Song] = []
        let data = Song(FileController().readFile("Song")).getSongDetails() as! Dictionary<String, [Dictionary<String, String>]>
        
        
        for artist in data.keys {
            for songDetails in data[artist]! {
                if artist == "Taylor Swift" {
                    let song = Song(#imageLiteral(resourceName: "taylor-swift-icon.PNG"), songDetails["title"]!, artist, songDetails["duration"]!)
                    tempSongs.append(song)
                } else {
                    let song = Song(#imageLiteral(resourceName: "john-mayer.PNG"), songDetails["title"]!, artist, songDetails["duration"]!)
                    tempSongs.append(song)
                }

            }
        }
        
        
//        let song1 = Song(#imageLiteral(resourceName: "taylor-swift-icon.PNG"), "Red", "Taylor Swift", "3:38")
//        let song2 = Song(#imageLiteral(resourceName: "taylor-swift-icon.PNG"), "Red", "Taylor Swift", "3:38")
//        let song3 = Song(#imageLiteral(resourceName: "taylor-swift-icon.PNG"), "Red", "Taylor Swift", "3:38")
//        let song4 = Song(#imageLiteral(resourceName: "taylor-swift-icon.PNG"), "Red", "Taylor Swift", "3:38")
        
//        tempSongs.append(song1)
//        tempSongs.append(song2)
//        tempSongs.append(song3)
//        tempSongs.append(song4)
        
        return tempSongs
    }
}

extension MusicListScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let music = musics[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell") as! MusicCell
        
        cell.setMusic(music: music)
        return cell
    }
}
