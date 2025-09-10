//
//  CurrencyViewModel.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 10/09/25.
//

import Foundation

@MainActor
class CurrencyViewModel: ObservableObject {
    @Published var rates: [String: Double] = [:]
    @Published var errorMessage: String? = nil
    
    private let fallbackRates: [String: Double] = [
        "USD": 0.19,
        "EUR": 0.16,
        "GBP": 0.14,
        "JPY": 28.0
    ]
    
    private let service: CurrencyServiceProtocol
    
    init(service: CurrencyServiceProtocol = CurrencyService()) {
        self.service = service
    }
    
    func loadRates() async {
        do {
            let fetchedRates = try await service.fetchRates()
            self.rates = fetchedRates
            self.errorMessage = nil
        } catch {
            self.rates = fallbackRates
            self.errorMessage = "API indisponível, usando taxas fixas."
        }
    }
}
