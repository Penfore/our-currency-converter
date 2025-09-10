//
//  CurrencyViewModelTests.swift
//  Our Currency ConverterTests
//
//  Created by Fulvio Leo on 10/09/25.
//

import XCTest
@testable import Our_Currency_Converter

final class CurrencyViewModelTests: XCTestCase {
    func testLoadRatesSuccess() async {
        let viewModel = await CurrencyViewModel(service: MockCurrencyServiceSuccess())
        
        await viewModel.loadRates()
        
        await MainActor.run {
            XCTAssertEqual(viewModel.rates["USD"], 0.20)
            XCTAssertNil(viewModel.errorMessage)
        }
    }
    
    func testLoadRatesFailureUsesFallbakc() async {
        let viewModel = await CurrencyViewModel(service: MockCurrencyServiceFailure())
        
        await viewModel.loadRates()
        
        await MainActor.run {
            XCTAssertEqual(viewModel.rates["USD"], 0.19)
            XCTAssertEqual(viewModel.errorMessage, "API indisponível, usando taxas fixas.")
        }
    }
    
    func testFallbackRatesWhenAPIUnavailable() async {
        let viewModel = await CurrencyViewModel()
        
        await viewModel.loadRates()
        
        await MainActor.run {
            XCTAssertFalse(viewModel.rates.isEmpty, "As taxas não deveriam estar vazias mesmo sem API")
            XCTAssertEqual(viewModel.rates["USD"], 0.19, "Deveria usar taxa fixa no fallback")
            XCTAssertEqual(viewModel.errorMessage, "API indisponível, usando taxas fixas.")
        }
    }
}
