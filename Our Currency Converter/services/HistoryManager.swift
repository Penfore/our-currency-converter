//
//  HistoryManager.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 23/09/25.
//

import Foundation

class HistoryManager: ObservableObject {
    @Published var conversions: [ConversionHistory] = []
    
    private let userDefaults = UserDefaults.standard
    private let historyKey = "ConversionHistory"
    
    init() {
        loadHistory()
    }
    
    func addConversion(_ conversion: ConversionHistory) {
        conversions.insert(conversion, at: 0)
        saveHistory()
    }
    
    func loadHistory() {
        guard let data = userDefaults.data(forKey: historyKey)
        else { return }
        do {
            conversions = try JSONDecoder().decode([ConversionHistory].self, from: data)
        } catch {
            print("Erro ao carregar histórico: \(error)")
            conversions = []
        }
    }
    
    func clearHistory() {
        conversions.removeAll()
        saveHistory()
    }
    
    private func saveHistory() {
        do {
            let data = try JSONEncoder().encode(conversions)
            userDefaults.set(data, forKey: historyKey)
        } catch {
            print("Erro ao salvar histórico: \(error)")
        }
    }
}
