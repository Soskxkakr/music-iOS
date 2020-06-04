//
//  MembershipCell.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 04/06/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import UIKit

class MembershipCell: UITableViewCell {

    @IBOutlet weak var membershipLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    var initialPrice : Double = 4.99
    
    func setPlan(_ plans : Int) {
        
        membershipLbl.text = "\(plans) Month Membership"
        priceLbl.text = "RM \(initialPrice*Double(plans))"
    }
}
