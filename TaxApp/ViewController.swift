//
//  ViewController.swift
//  TaxApp
//
//  Created by USER on 2023/09/05.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var taxSegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var prices: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PriceCell")
    }
    
    @IBAction func taxRateChanged(_ sender: UISegmentedControl) {
        calculateTax()
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        calculateTax()
        if let priceText = resultLabel.text, let price = Double(priceText) {
            prices.append(price)
            tableView.reloadData()
        }
    }
    
    
    @IBAction func totalButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showTotal", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTotal" {
            let destinationVC = segue.destination as! TotalViewController
            destinationVC.totalAmount = prices.reduce(0, +)
        }
    }
    
    func calculateTax() {
        guard let priceText = priceTextField.text, let price = Double(priceText) else {
            return
        }
        
        let taxRate = taxSegmentedControl.selectedSegmentIndex == 0 ? 0.10 : 0.08
        let taxAmount = price * taxRate
        let totalPrice = price + taxAmount
        resultLabel.text = String(totalPrice)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PriceCell", for: indexPath)
        cell.textLabel?.text = String(prices[indexPath.row])
        return cell
    }
}
