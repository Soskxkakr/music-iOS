//
//  PlanController.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 27/05/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import UIKit

class PlanController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var membership : [Int] = [1, 3, 6, 12]
    var renewedPlan : String = ""
    var monthPlan : Int = 0
    var user = User()
    let plan = MembershipCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func purchase(_ sender: UIButton) {
        
        let popupMsg = UIAlertController(title: "Purchase", message: "Are you sure you want to purchase this plan ?", preferredStyle: .alert)
        
        popupMsg.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.performSegue(withIdentifier: "purchase", sender: PlanController())
        }))
        popupMsg.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        present(popupMsg, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "purchase" {
            let confirm = segue.destination as! ConfirmPurchaseController
            confirm.receivedPlan = renewedPlan
            confirm.receivedMonth = monthPlan
            confirm.user = self.user
        }
    }
}

extension PlanController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return membership.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let plan = membership[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanCell") as! MembershipCell
        
        cell.setPlan(plan)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.renewedPlan = "\(membership[indexPath.row]) Month Membership"
        self.monthPlan = membership[indexPath.row]
    }
}
