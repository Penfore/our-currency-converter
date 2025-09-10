//
//  CurrencyServiceProtocol.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 10/09/25.
//

import Foundation

protocol CurrencyServiceProtocol {
    func fetchRates() async throws -> [String: Double]
}
