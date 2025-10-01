//
//  Our_Currency_ConverterApp.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 10/09/25.
//

import SwiftUI

@main
struct Our_Currency_ConverterApp: App {
    @StateObject private var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.currentTheme.colorScheme)
        }
    }
}
