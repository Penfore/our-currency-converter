//
//  ThemeSelectionView.swift
//  Our Currency Converter
//
//  Created by Fulvio Leo on 01/10/25.
//

import SwiftUI

struct ThemeSelectionView: View {
    @ObservedObject var themeManager: ThemeManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Aparência do App")) {
                    ForEach(AppTheme.allCases, id: \.self) { theme in
                        ThemeRowView(
                            theme: theme,
                            isSelected: themeManager.currentTheme == theme
                        ) {
                            themeManager.setTheme(theme)
                        }
                    }
                }
                
                Section(footer: Text("O tema Sistema segue automaticamente as configurações do seu dispositivo.")) { }
            }
            .navigationTitle("Tema")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Concluído") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ThemeRowView: View {
    let theme: AppTheme
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: theme.icon)
                    .foregroundColor(.primary)
                    .frame(width: 24, height: 24)
                
                Text(theme.displayName)
                    .foregroundColor(.primary)
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                        .fontWeight(.semibold)
                }
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ThemePreviewView: View {
    let theme: AppTheme
    
    var body: some View {
        VStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 8)
                .fill(theme == .dark ? Color.black : Color.white)
                .frame(height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            
            Text(theme.displayName)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    ThemeSelectionView(themeManager: ThemeManager())
}
