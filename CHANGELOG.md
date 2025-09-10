# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Multi-currency base support (convert from any currency to any currency)
- Historical rate charts and trends
- Rate alerts and notifications
- Dark mode support
- Home screen widgets
- More currency options including cryptocurrencies

## [1.0.0] - 2025-09-10

### Added
- 💱 **Currency Conversion** - Convert Brazilian Real (BRL) to major currencies (USD, EUR, GBP, JPY)
- 🔄 **Real-time Exchange Rates** - Fetches live rates from ExchangeRate-API
- 🛡️ **Offline Fallback** - Fixed exchange rates when API is unavailable
- 💾 **Persistent Settings** - Remembers selected currency using @AppStorage
- 🏗️ **MVVM Architecture** - Clean architecture with dependency injection
- 📱 **SwiftUI Interface** - Native iOS experience with modern UI
- 🧪 **Unit Testing** - Comprehensive test coverage with mocks
- 🔧 **Protocol-Oriented Design** - Testable and maintainable code structure

### Technical Details
- Built with SwiftUI and Swift 5.9+
- MVVM architecture with ObservableObject ViewModels
- URLSession with async/await for networking
- Protocol-based dependency injection
- XCTest with async testing support
- Supports iOS 17.0+

---

## Format Guidelines

### Types of Changes
- **Added** for new features
- **Changed** for changes in existing functionality
- **Deprecated** for soon-to-be removed features
- **Removed** for now removed features
- **Fixed** for any bug fixes
- **Security** in case of vulnerabilities

### Version Format
- Follow [Semantic Versioning](https://semver.org/)
- MAJOR.MINOR.PATCH
- MAJOR: Breaking changes
- MINOR: New features (backward compatible)
- PATCH: Bug fixes (backward compatible)