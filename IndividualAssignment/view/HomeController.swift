//
//  HomeController.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 25/05/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import UIKit

class HomeController: UITabBarController {

    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let musicScreen = self.viewControllers![0] as! MusicListScreen
        let searchScreen = self.viewControllers![1] as! SearchController
        let nav = self.viewControllers![2] as! UINavigationController
        
        let me = nav.viewControllers.first as! MeController
        musicScreen.user = self.user
        searchScreen.user = self.user
        me.user = self.user
        // Do any additional setup after loading the view.
    }
}
