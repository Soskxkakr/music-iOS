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
    var receivedPlan = "No subscription"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greeting.text = "Hi, "+user.getName()
        email.text = user.getEmail()
        contactNo.text = user.getContactNo()
        subscription.text = receivedPlan
        // Do any additional setup after loading the view.
    }

    @IBAction func renewPlan(_ sender: UIButton) {
        self.performSegue(withIdentifier: "renewPlan", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "renewPlan" {
            let plan = segue.destination as! PlanController
            plan.user = self.user
        }
    }
}
