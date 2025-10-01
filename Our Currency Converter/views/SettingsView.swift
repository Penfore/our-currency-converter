//
//  SettingsView.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 01/10/25.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var themeManager: ThemeManager
    @State private var showingThemeSelection = false
    
    var body: some View {
        NavigationView {
            List {
                // Appearance Section
                Section(header: Text("Aparência")) {
                    HStack {
                        Image(systemName: "paintbrush.fill")
                            .foregroundColor(.blue)
                            .frame(width: 24, height: 24)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Tema")
                                .font(.body)
                            Text(themeManager.currentTheme.displayName)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showingThemeSelection = true
                    }
                }
                
                // About Section
                Section(header: Text("Sobre o App")) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.blue)
                            .frame(width: 24, height: 24)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Versão")
                                .font(.body)
                            Text("0.1.0")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.blue)
                            .frame(width: 24, height: 24)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Desenvolvedor")
                                .font(.body)
                            Text("Fúlvio Leo")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                // Technical Information
                Section(footer:
                    VStack(spacing: 8) {
                        Text("Our Currency Converter")
                            .font(.caption)
                            .fontWeight(.medium)
                        Text("Desenvolvido com SwiftUI e seguindo arquitetura MVVM")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20)
                ) {
                    // Empty section for footer
                }
            }
            .navigationTitle("Configurações")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $showingThemeSelection) {
                ThemeSelectionView(themeManager: themeManager)
            }
        }
    }
}

#Preview {
    SettingsView(themeManager: ThemeManager())
}
