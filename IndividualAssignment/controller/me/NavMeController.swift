//
//  NavMeController.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 26/05/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import UIKit

class NavMeController: UINavigationController {

    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let me = self.topViewController as! MeController
        me.user = self.user
        // Do any additional setup after loading the view.
    }
}
