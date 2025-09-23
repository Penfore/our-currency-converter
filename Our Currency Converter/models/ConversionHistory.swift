//
//  ConversionHistory.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 23/09/25.
//

import Foundation

struct ConversionHistory: Identifiable, Codable {
    let id: UUID
    let fromAmount: Double
    let fromCurrency: String
    let toAmount: Double
    let toCurrency: String
    let exchangeRate: Double
    let timestamp: Date
    
    init(
        fromAmount: Double,
        fromCurrency: String,
        toAmount: Double,
        toCurrency: String,
        exchangeRate: Double
    ) {
        self.id = UUID()
        self.fromAmount = fromAmount
        self.fromCurrency = fromCurrency
        self.toAmount = toAmount
        self.toCurrency = toCurrency
        self.exchangeRate = exchangeRate
        self.timestamp = Date()
    }
    
    var formattedTimestamp: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from: timestamp)
    }
    
    var conversionSummary: String {
        return "\(fromAmount) \(fromCurrency) -> \(toAmount) \(toCurrency)"
    }
}
