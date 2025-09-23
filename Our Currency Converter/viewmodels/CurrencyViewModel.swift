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
    @Published var isLoading: Bool = false
    @Published var lastUpdateTime: Date? = nil
    @Published var isUsingFallbackRates: Bool = false
    @Published var historyManager = HistoryManager()
    
    private let fallbackRates: [String: Double] = [
        "USD": 0.19,
        "EUR": 0.16,
        "GBP": 0.14,
        "JPY": 28.0,
        "CAD": 0.25,
        "AUD": 0.28,
        "CHF": 0.17,
        "CNY": 1.35
    ]
    
    private let service: CurrencyServiceProtocol
    private let configManager = ConfigManager.shared
    
    init(service: CurrencyServiceProtocol = CurrencyService()) {
        self.service = service
    }
    
    func loadRates() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedRates = try await service.fetchRates()
            self.rates = fetchedRates
            self.lastUpdateTime = Date()
            self.isUsingFallbackRates = false
            self.errorMessage = nil
        } catch {
            await handleLoadingError(error)
        }
        
        isLoading = false
    }
    
    private func handleLoadingError(_ error: Error) async {
        self.rates = fallbackRates
        self.isUsingFallbackRates = true
        self.lastUpdateTime = Date()
        
        if !configManager.hasValidAPIKey {
            self.errorMessage = "Configure sua API key para obter taxas atualizadas. Usando taxas de demonstração."
        } else if let urlError = error as? URLError {
            switch urlError.code {
            case .notConnectedToInternet:
                self.errorMessage = "Sem conexão com a internet. Usando taxas offline."
            case .userAuthenticationRequired:
                self.errorMessage = "API key inválida. Verifique sua configuração."
            case .badServerResponse:
                self.errorMessage = "Erro no servidor da API. Usando taxas offline."
            default:
                self.errorMessage = "API indisponível. Usando taxas offline."
            }
        } else {
            self.errorMessage = "Erro ao carregar taxas. Usando taxas offline."
        }
    }
    
    func convertFromBRL(amount: Double, to currency: String) -> Double {
        guard let rate = rates[currency] else { return 0.0 }
        return amount * rate
    }
    
    func convertToBRL(amount: Double, from currency: String) -> Double {
        guard let rate = rates[currency], rate > 0 else { return 0.0 }
        return amount / rate
    }
    
    var lastUpdateFormatted: String {
        guard let lastUpdate = lastUpdateTime else { return "Nunca" }
        
        let formatter = DateFormatter()
        let now = Date()
        let timeInterval = now.timeIntervalSince(lastUpdate)
        
        if timeInterval < 60 {
            return "Agora mesmo"
        } else if timeInterval < 3600 {
            let minutes = Int(timeInterval / 60)
            return "\(minutes) min atrás"
        } else {
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            return "Às \(formatter.string(from: lastUpdate))"
        }
    }
    
    var shouldRefreshRates: Bool {
        guard let lastUpdate = lastUpdateTime else { return true }
        let oneHourAgo = Date().addingTimeInterval(-3600)
        return lastUpdate < oneHourAgo
    }
    
    func convertCurrency(
        amount: Double,
        fromCurrency: String,
        toCurrency: String
    ) -> Double {
        var convertedAmout: Double
        var exchangeRate: Double
        
        if fromCurrency == "BRL" && toCurrency != "BRL" {
            convertedAmout = convertFromBRL(amount: amount, to: toCurrency)
            exchangeRate = rates[toCurrency] ?? 0.0
        } else if fromCurrency != "BRL" && toCurrency == "BRL" {
            convertedAmout = convertToBRL(amount: amount, from: fromCurrency)
            exchangeRate = 1.0 / (rates[fromCurrency] ?? 1.0)
        } else if fromCurrency == "BRL" && toCurrency == "BRL" {
            convertedAmout = amount
            exchangeRate = 1.0
        } else {
            let amountInBRL = convertToBRL(amount: amount, from: fromCurrency)
            convertedAmout = convertFromBRL(amount: amountInBRL, to: toCurrency)
            
            let fromRate = rates[fromCurrency] ?? 1.0
            let toRate = rates[toCurrency] ?? 1.0
            exchangeRate = toRate / fromRate
        }
        
        let historyEntry = ConversionHistory(
            fromAmount: amount,
            fromCurrency: fromCurrency,
            toAmount: convertedAmout,
            toCurrency: toCurrency,
            exchangeRate: exchangeRate
        )
        historyManager.addConversion(historyEntry)
        
        return convertedAmout
    }
    
    func clearConversionHistory() {
        historyManager.clearHistory()
    }
}
