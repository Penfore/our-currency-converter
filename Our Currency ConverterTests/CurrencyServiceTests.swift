//
//  CurrencyServiceTests.swift
//  Our Currency ConverterTests
//
//  Created by Fulvio Leo on 10/09/25.
//

import XCTest
@testable import Our_Currency_Converter

final class CurrencyServiceTests: XCTestCase {
    func testFetchRatesFromAPI() async throws {
        let service = CurrencyService()
        do {
            let rates = try await service.fetchRates()
            XCTAssertFalse(rates.isEmpty, "As taxas não deveriam estar vazias")
            XCTAssertNotNil(rates["USD"])
        } catch {
            XCTFail("Falha ao buscar taxas: \(error)")
        }
    }
}
