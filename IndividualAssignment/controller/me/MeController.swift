//
//  MeController.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 26/05/2020.
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
        subscription.text = "Not Active"
        // Do any additional setup after loading the view.
    }
}
