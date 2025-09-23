//
//  ContentView.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 10/09/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CurrencyViewModel()

    var body: some View {
        TabView {
            CurrencyView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "dollarsign.circle.fill")
                    Text("Conversão")
                }

            HistoryView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("Histórico")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
