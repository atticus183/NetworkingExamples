//
//  CurrencyJSONVCTableViewController.swift
//  NetworkingExamples
//
//  Created by Josh R on 5/1/20.
//  Copyright © 2020 Josh R. All rights reserved.
//

import UIKit

class CurrencyJSONTVC: UITableViewController {
    
    var retrievedRates: CurrencyRates? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    lazy var jsonDecoder = JSONDecoder()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonDecoder.dateDecodingStrategy = .iso8601  //JSONDecoder defaults to using foundation dates, iso is more common
        jsonDecoder.fetch(urlString: CurrencyRates.ratesURLString) { (response: Result<CurrencyRates, Error>) in
            switch response {
            case .failure(let error):
                print(error)
            case .success(let result):
                self.retrievedRates = result
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let retrievedRates = retrievedRates?.rates.count else { return 0 }
        return retrievedRates
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1 , reuseIdentifier: nil)  //since I'm not during the dequeue method, a reuse identifier isn't required
        
        guard let retrievedRates = retrievedRates else { return UITableViewCell() }
        let code = retrievedRates.currencyCodeArray[indexPath.item]  //or indexPath.row works too
        cell.textLabel?.text = code
        cell.detailTextLabel?.text = String(retrievedRates.rates[code] ?? 0.0)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let retrievedRates = retrievedRates else { return nil }
        let currencyHeaderView = CurrencyInfoTVHeader()
        currencyHeaderView.baseRateLbl.text = "Base: \(retrievedRates.base)"
        currencyHeaderView.dateLbl.text = "as of: \(retrievedRates.date)"
        return currencyHeaderView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    
}
