//
//  ContentView.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 10/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var brlValue: String = ""
    @State private var result: String = ""
    
    @AppStorage("selectedCurrency") private var selectedCurrency: String = "USD"
    
    @StateObject private var viewModel = CurrencyViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Currency Converter")
                    .font(.title)
                
                TextField("Valor em BRL", text: $brlValue)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                Picker("Moeda", selection: $selectedCurrency) {
                    ForEach(viewModel.rates.keys.sorted(), id: \.self) {
                        currency in Text(currency).tag(currency)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Button("Converter") {
                    if let value = Double(brlValue),
                       let rate = viewModel.rates[selectedCurrency] {
                        let converted = value * rate
                        result = String(format: "%.2f %@", converted, selectedCurrency)
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                if !result.isEmpty {
                    Text("Resultado: \(result)")
                        .font(.headline)
                        .padding(.top, 20)
                }
                
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.top, 10)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Our Finances - Converter")
            .task {
                await viewModel.loadRates()
            }
        }
    }
}

#Preview {
    ContentView()
}
