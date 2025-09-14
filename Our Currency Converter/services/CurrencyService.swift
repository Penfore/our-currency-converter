//
//  CurrencyService.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 10/09/25.
//

import Foundation

class CurrencyService: CurrencyServiceProtocol {
    private let apiKey = "NO-API-YET-WILL-CREATE-KEY-AND-MANAGE-LATER"
    
    func fetchRates() async throws -> [String: Double] {
        let url = URL(string: "https://v6.exchangerate-api.com/v6/\(apiKey)/latest/BRL")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(ExchangeRateResponse.self, from: data)
        
        return decoded.conversion_rates
    }
}
