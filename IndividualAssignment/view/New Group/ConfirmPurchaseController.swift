//
//  ConfirmPurchaseController.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 06/06/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import UIKit

class ConfirmPurchaseController: UIViewController {
    
    @IBOutlet weak var membershipPlan: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    var receivedPlan : String = ""
    var receivedMonth : Int = 0
    var user = User()
    let date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the date
        let date = Calendar.current.component(.day, from: self.date)
        var month = Calendar.current.component(.month, from: self.date) + receivedMonth
        let year = Calendar.current.component(.year, from: self.date)

        if monthCheck(month) {
            month = month - 12
            dateLbl.text = "23:59, \(date)-\(setMonth(month))-\(year+1)"
        } else {
            dateLbl.text = "23:59, \(date)-\(setMonth(month))-\(year)"
        }
        
        membershipPlan.text = receivedPlan
        // Do any additional setup after loading the view.
    }

    func setMonth(_ month : Int) -> String {
        
        var tempMonth = ""
        
        if month == 1 {
            tempMonth = "January"
        } else if month == 2 {
            tempMonth = "February"
        } else if month == 3 {
            tempMonth = "March"
        } else if month == 4 {
            tempMonth = "April"
        } else if month == 5 {
            tempMonth = "May"
        } else if month == 6 {
            tempMonth = "June"
        } else if month == 7 {
            tempMonth = "July"
        } else if month == 8 {
            tempMonth = "August"
        } else if month == 9 {
            tempMonth = "September"
        } else if month == 10 {
            tempMonth = "October"
        } else if month == 11 {
            tempMonth = "November"
        } else if month == 12 {
            tempMonth = "December"
        }
        
        return tempMonth
    }
    
    func monthCheck(_ month : Int) -> Bool {
        
        if (month+receivedMonth) > 12 {
            return true
        } else {
            return false
        }
        
    }
    
    @IBAction func purchasePlan(_ sender: UIButton) {
        
        let popupMsg = UIAlertController(title: "Purchase Successful!", message: "Plan has been purchased", preferredStyle: .alert)
        popupMsg.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.performSegue(withIdentifier: "updatePlan", sender: self)
        }))
        present(popupMsg, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "updatePlan" {
            let me = segue.destination as! MeController
            me.receivedPlan = "Valid Until \(String(describing: dateLbl.text!))"
            me.user = self.user
        }
    }
    
}
