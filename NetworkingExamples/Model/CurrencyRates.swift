//
//  CurrencyRates.swift
//  NetworkingExamples
//
//  Created by Josh R on 5/1/20.
//  Copyright © 2020 Josh R. All rights reserved.
//

import Foundation

//Retrieved from the European bank
struct CurrencyRates: Codable {
    let rates: [String: Double]
    let date: String   //saved as "yyyy/mm/dd"
    let base: String
    
    static let ratesURLString = "https://api.exchangeratesapi.io/latest?base=USD"
    
    var currencyCodeArray: [String] {
        return Array(rates.keys).sorted()
    }
}
