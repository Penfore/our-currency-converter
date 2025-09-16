//
//  CurrencyService.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 10/09/25.
//

import Foundation

class CurrencyService: CurrencyServiceProtocol {
    private let configManager = ConfigManager.shared
    
    func fetchRates() async throws -> [String: Double] {
        guard configManager.hasValidAPIKey else {
            throw URLError(.userAuthenticationRequired)
        }
        
        let apiKey = configManager.exchangeRateAPIKey
        let baseURL = configManager.exchangeRateBaseURL
        
        guard let url = URL(string: "\(baseURL)/\(apiKey)/latest/BRL") else {
            throw URLError(.badURL)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            if let httpResponse = response as? HTTPURLResponse {
                guard 200...299 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
            }
            
            let decoded = try JSONDecoder().decode(ExchangeRateResponse.self, from: data)
            
            guard !decoded.conversion_rates.isEmpty else {
                throw URLError(.cannotParseResponse)
            }
            
            return decoded.conversion_rates
        } catch {
            throw error
        }
    }
}
