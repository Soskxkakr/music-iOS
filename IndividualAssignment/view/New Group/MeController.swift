//
//  MeController.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 27/05/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import UIKit

class MeController: UIViewController {

    @IBOutlet weak var greeting: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var contactNo: UILabel!
    @IBOutlet weak var subscription: UILabel!
    
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greeting.text = "Hi, "+user.getName()
        email.text = user.getEmail()
        contactNo.text = user.getContactNo()
        // Do any additional setup after loading the view.
    }

}
