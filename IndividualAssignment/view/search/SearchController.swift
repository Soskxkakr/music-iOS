//
//  SearchController.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 30/05/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import UIKit

class SearchController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var user = User()
    var musics : [Song] = []
    var selectedMusic = Song()
    var searchMusic = [Song]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musics = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func createArray() -> [Song] {
        
        var tempSongs : [Song] = []
        let data = Song(FileController().readFile("Song")).getSongDetails() as! Dictionary<String, [Dictionary<String, String>]>
        
        for artist in data.keys {
            for songDetails in data[artist]! {
                if artist == "Taylor Swift" {
                    let song = Song(#imageLiteral(resourceName: "taylor-swift.PNG"), songDetails["title"]!, artist, songDetails["duration"]!)
                    tempSongs.append(song)
                } else {
                    let song = Song(#imageLiteral(resourceName: "john-mayer.PNG"), songDetails["title"]!, artist, songDetails["duration"]!)
                    tempSongs.append(song)
                }
            }
        }
        
        return tempSongs
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "player" {
            let player = segue.destination as! PlayerScreen
            player.user = self.user
            player.mySong = self.selectedMusic
        }
    }
}

extension SearchController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchMusic.count
        } else {
            return musics.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let music = musics[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchedMusic") as! SearchCell
        if searching {
            cell.setMusic(music: searchMusic[indexPath.row])
        } else {
            cell.setMusic(music: music)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMusic.image = musics[indexPath.row].image
        selectedMusic.title = musics[indexPath.row].title
        selectedMusic.artist = musics[indexPath.row].artist
        selectedMusic.duration = musics[indexPath.row].duration
        performSegue(withIdentifier: "player", sender: self)
    }
}

extension SearchController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchMusic = musics.filter( {$0.title.prefix(searchText.count) == searchText} )
        searching = true
        tableView.reloadData()
    }
}
