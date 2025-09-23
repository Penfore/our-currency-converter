//
//  HistoryView.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 23/09/25.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var viewModel: CurrencyViewModel
    
    var body: some View {
        NavigationView {
            List {
                if viewModel.historyManager.conversions.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "clock.arrow.circlepath")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        
                        Text("Nenhuma conversão ainda")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                        
                        Text("Suas conversões aparecerão aqui")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 40)
                    .listRowSeparator(.hidden)
                } else {
                    ForEach(viewModel.historyManager.conversions) {
                        conversion in HistoryRowView(conversion: conversion)
                    }
                }
            }
            .navigationTitle("Histórico")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                if !viewModel.historyManager.conversions.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Limpar") {
                            viewModel.clearConversionHistory()
                        }
                        .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

struct HistoryRowView: View {
    let conversion: ConversionHistory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(conversion.fromCurrency)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text(String(format: "%.2f", conversion.fromAmount))
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                Image(systemName: "arrow.right")
                    .foregroundColor(.blue)
                    .font(.system(size: 16, weight: .medium))
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 2) {
                    Text(conversion.toCurrency)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text(String(format: "%.2f", conversion.toAmount))
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                }
            }
            
            HStack {
                Text("Taxa: \(String(format: "%.4f", conversion.exchangeRate))")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text(conversion.timestamp.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    HistoryView(viewModel: CurrencyViewModel())
}
