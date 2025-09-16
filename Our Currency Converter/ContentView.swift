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
                
                VStack(spacing: 8) {
                    Text("💰 Currency Converter")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    HStack {
                        if viewModel.isLoading {
                            ProgressView()
                                .scaleEffect(0.8)
                            Text("Atualizando taxas...")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        } else {
                            Circle()
                                .fill(viewModel.isUsingFallbackRates ? Color.orange : Color.green)
                                .frame(width: 8, height: 8)
                            Text(viewModel.isUsingFallbackRates ? "Taxas offline" : "Taxas atualizadas")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Text("Atualizado: \(viewModel.lastUpdateFormatted)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Input section
                VStack(spacing: 12) {
                    TextField("Digite o valor em BRL", text: $brlValue)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .disabled(viewModel.isLoading)
                    
                    HStack {
                        Text("BRL")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(.secondary)
                        
                        Picker("Converter para", selection: $selectedCurrency) {
                            ForEach(viewModel.rates.keys.sorted(), id: \.self) { currency in
                                Text(currency).tag(currency)
                            }
                        }
                        .pickerStyle(.menu)
                        .disabled(viewModel.isLoading)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Convert button
                Button(action: convertCurrency) {
                    HStack {
                        if viewModel.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(0.8)
                        } else {
                            Image(systemName: "arrow.2.circlepath")
                        }
                        Text("Converter")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                .background(viewModel.isLoading ? Color.gray : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .disabled(viewModel.isLoading || brlValue.isEmpty)
                
                // Result section
                if !result.isEmpty {
                    VStack(spacing: 8) {
                        Text("Resultado")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text(result)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(10)
                    }
                    .transition(.scale.combined(with: .opacity))
                }
                
                // Error message
                if let error = viewModel.errorMessage {
                    HStack {
                        Image(systemName: viewModel.isUsingFallbackRates ? "wifi.slash" : "exclamationmark.triangle")
                            .foregroundColor(viewModel.isUsingFallbackRates ? .orange : .red)
                        
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
                
                Spacer()
                
                // Refresh button
                if viewModel.shouldRefreshRates && !viewModel.isLoading {
                    Button("🔄 Atualizar taxas") {
                        Task {
                            await viewModel.loadRates()
                        }
                    }
                    .font(.caption)
                    .foregroundColor(.blue)
                }
            }
            .padding()
            .navigationTitle("Our Currency Converter")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.loadRates()
            }
            .refreshable {
                await viewModel.loadRates()
            }
        }
    }
    
    private func convertCurrency() {
        guard let value = Double(brlValue.replacingOccurrences(of: ",", with: ".")) else {
            return
        }
        
        let converted = viewModel.convertFromBRL(amount: value, to: selectedCurrency)
        result = String(format: "%.2f %@", converted, selectedCurrency)
        
        // Add haptic feedback
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
    }
}

#Preview {
    ContentView()
}
