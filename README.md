# 💱 Our Currency Converter

<div align="center">
  <img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white" alt="iOS" />
  <img src="https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white" alt="Swift" />
  <img src="https://img.shields.io/badge/SwiftUI-0052CC?style=for-the-badge&logo=swift&logoColor=white" alt="SwiftUI" />
  <img src="https://img.shields.io/badge/version-0.1.0-blue?style=for-the-badge" alt="Version" />
  <img src="https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge" alt="License" />
  <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge" alt="PRs Welcome" />
</div>

<div align="center">
  <h3>💰 Convert currencies with real-time rates and persistent history</h3>
  <p>A clean, efficient and reliable currency converter app built with SwiftUI following MVVM architecture principles.</p>
</div>

---

## ✨ Features

### 🚀 **Current Features**
- 💱 **Real-time Conversion** - Convert BRL to USD, EUR, GBP, JPY and more
- 📊 **Conversion History** - Track all your conversions with persistent storage
- 🔄 **Live Exchange Rates** - Fetches current rates from ExchangeRate-API
- 📱 **Native iOS Experience** - Built with SwiftUI for optimal performance
- 🛡️ **Offline Fallback** - Works even when API is unavailable with fixed rates
- 💾 **Persistent Data** - Remembers your conversion history and preferences
- 🔐 **Secure Configuration** - API keys stored securely outside source code
- 🎯 **Loading States** - Real-time feedback with visual indicators
- 📲 **Tab Navigation** - Clean interface with conversion, history, and settings tabs
- 🎨 **Theme Support** - Light, dark, and system theme options with persistent selection
- ⚙️ **Settings Screen** - Centralized configuration with theme selection and app info
- 🧪 **Fully Tested** - Comprehensive unit tests with mocks

### 📋 **Planned Features**
- 🌍 **Multi-currency Base** - Convert from any currency to any currency
- 📈 **Historical Rate Charts** - View exchange rate trends over time
- ⏰ **Rate Alerts** - Get notified when rates reach your target
- 🌐 **More Currencies** - Support for cryptocurrency and exotic currencies
- 📱 **Widgets** - Home screen widgets for quick conversions

## 📱 Screenshots

*Screenshots will be added soon. The app features a clean, minimalist interface with tab navigation between conversion and history screens.*

## 🏗️ Architecture

This project follows **MVVM (Model-View-ViewModel)** architecture, ensuring:

- **Separation of Concerns** - Clear separation between UI, business logic, and data
- **Testability** - Easy to unit test business logic with dependency injection
- **Maintainability** - Clean, organized code that's easy to modify and extend
- **Protocol-Oriented Design** - Uses protocols for better abstraction and testing
- **Secure Configuration** - External API key management for production safety

### Project Structure

```
Our Currency Converter/
├── models/                   # Data models
│   ├── ConversionHistory.swift    # History data model
│   └── ExchangeRateSwift.swift   # Exchange rate response model
├── services/                 # Network and business logic
│   ├── ConfigManager.swift       # Secure configuration management
│   ├── HistoryManager.swift      # Conversion history management
│   ├── CurrencyServiceProtocol.swift
│   └── CurrencyService.swift     # API service with secure key handling
├── viewmodels/              # ViewModels (business logic)
│   └── CurrencyViewModel.swift   # Enhanced with history integration
├── views/                   # SwiftUI Views
│   ├── ContentView.swift         # Tab navigation container
│   ├── CurrencyView.swift        # Main conversion interface
│   ├── HistoryView.swift          # Conversion history display
│   └── Our_Currency_ConverterApp.swift
└── Assets.xcassets/         # App assets

Tests/
├── CurrencyServiceTests.swift
├── CurrencyViewModelTests.swift
└── MockCurrencyService.swift
```

### Tech Stack

- **Framework**: SwiftUI
- **Language**: Swift 5.9+
- **Architecture**: MVVM
- **Networking**: URLSession with async/await
- **Persistence**: UserDefaults with JSON encoding
- **Security**: External API key configuration
- **Testing**: XCTest with async testing support
- **API**: [ExchangeRate-API](https://exchangerate-api.com/)

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have:

- **Xcode 15.0+**
- **iOS 17.0+** (deployment target)
- **macOS 14.0+** (for development)
- **ExchangeRate-API Key** (free tier available)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Penfore/our-currency-converter.git
   cd our-currency-converter
   ```

2. **Open in Xcode**
   ```bash
   open "Our Currency Converter.xcodeproj"
   ```

3. **Configure API Key** (Required for live rates)
   
   Create an `APIKeys.plist` file in the project root:
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
   <dict>
       <key>ExchangeRateAPIKey</key>
       <string>YOUR-API-KEY-HERE</string>
   </dict>
   </plist>
   ```

4. **Add APIKeys.plist to Xcode**
   - Drag the file into your Xcode project
   - **Uncheck** "Add to target" to keep it local only
   - The file is already in `.gitignore` for security

5. **Build and Run**
   - Select your target device/simulator
   - Press `Cmd+R` or click the Run button

### API Configuration

To use live exchange rates:

1. **Sign up** at [ExchangeRate-API](https://exchangerate-api.com/) (free tier: 1,500 requests/month)
2. **Get your API key** from the dashboard
3. **Create** `APIKeys.plist` as shown above with your real API key
4. **The app will automatically** load your key securely

*Note: The app includes fallback rates and works without an API key, but with limited currency support.*

## 🧪 Testing

### Run Tests

```bash
# Run all tests
xcodebuild test -scheme "Our Currency Converter" -destination "platform=iOS Simulator,name=iPhone 15"

# Or use Xcode
# Press Cmd+U to run all tests
```

### Test Coverage

- **Services**: Full coverage with success/failure scenarios
- **ViewModels**: Comprehensive testing with mock dependencies
- **History Management**: Complete CRUD operations testing
- **Error Handling**: Tests for network failures and fallback behavior

### Testing Architecture

The project uses:
- **Protocol-based mocking** for services
- **Async/await testing** for modern Swift concurrency
- **MainActor testing** for UI state validation
- **Dependency injection** for isolated unit tests

## 📖 API Documentation

### CurrencyServiceProtocol

```swift
protocol CurrencyServiceProtocol {
    func fetchRates() async throws -> [String: Double]
}
```

### CurrencyViewModel

```swift
@MainActor
class CurrencyViewModel: ObservableObject {
    @Published var rates: [String: Double]
    @Published var errorMessage: String?
    @Published var historyManager = HistoryManager()
    
    func loadRates() async
    func convertCurrency(amount: Double, fromCurrency: String, toCurrency: String) -> Double
    func clearConversionHistory()
}
```

### HistoryManager

```swift
class HistoryManager: ObservableObject {
    @Published var conversions: [ConversionHistory] = []
    
    func addConversion(_ conversion: ConversionHistory)
    func clearHistory()
}
```

## 🤝 Contributing

We love contributions! Please read our [Contributing Guide](CONTRIBUTING.md) to learn about our development process.

### Quick Start for Contributors

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'feat: add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

### Development Guidelines

- Follow [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- Write meaningful commit messages using [Conventional Commits](https://conventionalcommits.org/)
- Add tests for new features
- Update documentation as needed
- Ensure code passes all tests before submitting PR

### Types of Contributions

- 🐛 **Bug reports** - Help us identify and fix issues
- 💡 **Feature requests** - Suggest new functionality
- 🔧 **Code contributions** - Implement features or fix bugs
- 📚 **Documentation** - Improve docs and examples
- 🎨 **Design** - UI/UX improvements
- 🌍 **Localization** - Help translate the app

## 🤖 AI-Assisted Development

This project embraces modern development practices and acknowledges the role of AI in today's software development landscape.

### Our Position on AI

- 🎯 **AI as a Tool**: We recognize that AI tools (like GitHub Copilot, ChatGPT, etc.) are valuable assistants that help developers learn, explore new technologies, and increase productivity
- 👥 **Human Review Required**: While AI can assist with code generation and problem-solving, **all code must be reviewed, understood, and validated by real humans** before being merged
- 🧠 **Learning Enhancement**: AI tools are excellent for learning new patterns, understanding complex architectures, and exploring different implementation approaches
- 🔍 **Quality Assurance**: Contributors should always understand the code they're submitting, regardless of how it was generated

### Guidelines for AI-Assisted Contributions

- ✅ **Use AI tools** to help with boilerplate code, documentation, or learning new concepts
- ✅ **Review and understand** all AI-generated code before submitting
- ✅ **Test thoroughly** - AI-generated code should be tested just like any other code
- ✅ **Document your approach** - If AI helped solve a complex problem, consider documenting the solution for others
- ❌ **Don't blindly copy-paste** AI-generated code without understanding it
- ❌ **Don't rely solely on AI** for architectural decisions or critical business logic

### The Human Touch

While we embrace AI assistance, we believe in:
- **Human creativity** in solving complex problems
- **Human judgment** in making architectural decisions
- **Human empathy** in understanding user needs
- **Human responsibility** for code quality and security

This project is built by humans, for humans, with AI as a helpful companion in our development journey.

## 🔒 Security & Privacy

- **No Personal Data**: The app doesn't collect or store personal information
- **Network Requests**: Only makes requests to ExchangeRate-API for currency data
- **Local Storage**: Stores conversion history and preferences locally on device
- **Secure API Keys**: API keys stored in external configuration files (not in source code)
- **Open Source**: All code is public and auditable

For security reports, please see our [Security Policy](SECURITY.md).

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors & Contributors

- **[Fúlvio Leo]** - *Initial work* - [@Penfore](https://github.com/Penfore)

See also the list of [contributors](https://github.com/Penfore/our-currency-converter/contributors) who participated in this project.

## 📞 Support & Community

- 🐛 **Issues**: [GitHub Issues](https://github.com/Penfore/our-currency-converter/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/Penfore/our-currency-converter/discussions)
- 📧 **Email**: fulvioleo.dev@pm.me

## 🙏 Acknowledgments

- Exchange rates provided by [ExchangeRate-API](https://exchangerate-api.com/)
- Built with [SwiftUI](https://developer.apple.com/xcode/swiftui/) by Apple
- Inspired by the need for a simple, reliable currency converter with history tracking
- Thanks to all [contributors](https://github.com/Penfore/our-currency-converter/contributors)

## 📈 Project Stats

<div align="center">
  <img src="https://img.shields.io/github/stars/Penfore/our-currency-converter?style=social" alt="GitHub stars" />
  <img src="https://img.shields.io/github/forks/Penfore/our-currency-converter?style=social" alt="GitHub forks" />
  <img src="https://img.shields.io/github/issues/Penfore/our-currency-converter" alt="GitHub issues" />
  <img src="https://img.shields.io/github/issues-pr/Penfore/our-currency-converter" alt="GitHub pull requests" />
</div>

---

<div align="center">
  <p>Made with ❤️ and 💸 by developers, for developers</p>
  <p>If this project helped you, please consider giving it a ⭐!</p>
</div>
