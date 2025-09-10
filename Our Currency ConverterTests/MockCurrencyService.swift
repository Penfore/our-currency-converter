//
//  MockCurrencyService.swift
//  Our Currency ConverterTests
//
//  Created by Fulvio Leo on 10/09/25.
//

import Foundation
@testable import Our_Currency_Converter

class MockCurrencyServiceSuccess: CurrencyServiceProtocol {
    func fetchRates() async throws -> [String: Double] {
        return ["USD": 0.20, "EUR": 0.18]
    }
}

class MockCurrencyServiceFailure: CurrencyServiceProtocol {
    func fetchRates() async throws -> [String: Double] {
        throw URLError(.notConnectedToInternet)
    }
}
