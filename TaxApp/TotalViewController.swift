//
//  TotalViewController.swift
//  TaxApp
//
//  Created by USER on 2023/09/05.
//

import UIKit

class TotalViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    
    var totalAmount: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "合計金額は \(totalAmount) 円です。"
    }
}
