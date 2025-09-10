//
//  ExchangeRateSwift.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 10/09/25.
//

import Foundation

struct ExchangeRateResponse: Codable {
    let conversion_rates: [String: Double]
}
