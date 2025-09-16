//
//  ConfigManager.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 16/09/25.
//

import Foundation

struct ConfigManager {
    static let shared = ConfigManager()
    
    private init() {}
    
    var exchangeRateAPIKey: String {
        // Try to load from APIKeys.plist first (for local development)
        if let path = Bundle.main.path(forResource: "APIKeys", ofType: "plist"),
           let plist = NSDictionary(contentsOfFile: path),
           let key = plist["ExchangeRateAPIKey"] as? String,
           !key.isEmpty {
            return key
        }
        
        // Fallback to environment variable (useful for CI/CD)
        if let envKey = ProcessInfo.processInfo.environment["EXCHANGE_RATE_API_KEY"],
           !envKey.isEmpty {
            return envKey
        }
        
        return "demo-key-replace-with-real-key"
    }
    
    var hasValidAPIKey: Bool {
        let key = exchangeRateAPIKey
        return !key.isEmpty && key != "demo-key-replace-with-real-key"
    }
    
    var exchangeRateBaseURL: String {
        return "https://v6.exchangerate-api.com/v6"
    }
}
