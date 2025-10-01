//
//  ThemeManager.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 01/10/25.
//

import SwiftUI
import Foundation

enum AppTheme: String, CaseIterable {
    case system = "system"
    case light = "light"
    case dark = "dark"
    
    var displayName: String {
        switch self {
        case .system:
            return "Sistema"
        case .light:
            return "Claro"
        case .dark:
            return "Escuro"
        }
    }
    
    var icon: String {
        switch self {
        case .system:
            return "gear"
        case .light:
            return "sun.max"
        case .dark:
            return "moon"
        }
    }
    
    var colorScheme: ColorScheme? {
        switch self {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}

class ThemeManager: ObservableObject {
    @Published var currentTheme: AppTheme = .system
    
    private let userDefaults = UserDefaults.standard
    private let themeKey = "AppTheme"
    
    init() {
        loadTheme()
    }
    
    func setTheme(_ theme: AppTheme) {
        currentTheme = theme
        saveTheme()
    }
    
    private func saveTheme() {
        userDefaults.set(currentTheme.rawValue, forKey: themeKey)
    }
    
    private func loadTheme() {
        if let savedTheme = userDefaults.string(forKey: themeKey),
           let theme = AppTheme(rawValue: savedTheme) {
            currentTheme = theme
        }
    }
}

extension Color {
    static let theme = ThemeColors()
}

struct ThemeColors {
    let primary = Color("PrimaryColor")
    let secondary = Color("SecondaryColor")
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let surface = Color("SurfaceColor")
    let success = Color("SuccessColor")
    let warning = Color("WarningColor")
    let error = Color("ErrorColor")
}
