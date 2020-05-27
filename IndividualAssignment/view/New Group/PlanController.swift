//
//  PlanController.swift
//  IndividualAssignment
//
//  Created by Reinaldo Taslim on 27/05/2020.
//  Copyright © 2020 Reinaldo Taslim. All rights reserved.
//

import UIKit

class PlanController: UIViewController {

    @IBOutlet weak var oneMonthPlan: UILabel!
    @IBOutlet weak var threeMonthsPlan: UILabel!
    @IBOutlet weak var sixMonthsPlan: UILabel!
    @IBOutlet weak var twelveMonthsPlan: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var oneMonthPrice : Double = 4.99
        
        oneMonthPlan.text = "RM \(String(format: "%.2f", oneMonthPrice))"
        threeMonthsPlan.text = "RM \(String(format: "%.2f", oneMonthPrice*3*0.67))"
        sixMonthsPlan.text = "RM \(String(format: "%.2f", oneMonthPrice*6*0.67))"
        twelveMonthsPlan.text = "RM \(String(format: "%.2f", oneMonthPrice*12*0.67))"
        
        // Do any additional setup after loading the view.
    }
}
