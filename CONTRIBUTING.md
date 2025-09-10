# Contributing to Our Currency Converter

First off, thank you for considering contributing to Our Currency Converter! 🎉

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Process](#development-process)
- [Style Guidelines](#style-guidelines)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

### Our Pledge

We pledge to make participation in our project a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Our Standards

Examples of behavior that contributes to creating a positive environment include:
- Using welcoming and inclusive language
- Being respectful of differing viewpoints and experiences
- Gracefully accepting constructive criticism
- Focusing on what is best for the community
- Showing empathy towards other community members

## Getting Started

### Prerequisites

- Xcode 15.0 or later
- iOS 17.0+ (deployment target)
- macOS 14.0+ (for development)
- Git
- Basic knowledge of Swift and SwiftUI

### Setup Development Environment

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/your-username/our-currency-converter.git
   cd our-currency-converter
   ```
3. Add the original repository as upstream:
   ```bash
   git remote add upstream https://github.com/Penfore/our-currency-converter.git
   ```
4. Open the project in Xcode:
   ```bash
   open "Our Currency Converter.xcodeproj"
   ```
5. Build and run to make sure everything works:
   - Press `Cmd+R` or click the Run button

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues as you might find that the problem has already been reported.

When you create a bug report, please include:
- **A clear and descriptive title**
- **Steps to reproduce** the behavior
- **Expected behavior**
- **Actual behavior**
- **Screenshots** if applicable
- **Device information** (iOS version, device model, etc.)
- **App version**

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:
- **A clear and descriptive title**
- **A detailed description** of the suggested enhancement
- **The motivation** for the enhancement
- **Examples** of how the enhancement would be used

### Code Contributions

#### Good First Issues

Look for issues labeled `good first issue` if you're new to the project.

#### Areas Where We Need Help

- UI/UX improvements
- Performance optimizations
- Testing coverage
- Documentation
- Accessibility features
- Internationalization/Localization
- Additional currency support
- Historical rate charts

## Development Process

### Branching Strategy

We use a simplified Git flow:
- `main` - Production ready code
- `develop` - Integration branch for features
- `feature/feature-name` - Feature branches
- `bugfix/bug-description` - Bug fix branches
- `hotfix/critical-fix` - Critical fixes

### Workflow

1. Create a new branch from `develop`:
   ```bash
   git checkout develop
   git pull upstream develop
   git checkout -b feature/your-feature-name
   ```

2. Make your changes and commit them:
   ```bash
   git add .
   git commit -m "feat: add your feature description"
   ```

3. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

4. Create a Pull Request

## Style Guidelines

### Swift Code Style

We follow the [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/):

- Use descriptive names for variables, functions, and types
- Follow Swift naming conventions (camelCase for variables, PascalCase for types)
- Use meaningful variable and function names
- Keep functions focused and small
- Add documentation comments for public APIs

### SwiftUI Guidelines

- Prefer `@State` for local view state
- Use `@StateObject` for view models
- Use `@ObservedObject` for passed-in objects
- Keep views small and focused
- Extract reusable components into separate views

### Architecture Guidelines

- Follow MVVM architecture principles
- Maintain separation of concerns
- Use dependency injection for testability
- Write testable code
- Keep business logic in ViewModels
- Use protocols for abstractions

### File Organization

```
Our Currency Converter/
├── models/              # Data models
├── services/           # Business logic and networking
├── viewmodels/         # ViewModels
├── views/              # SwiftUI views
└── Assets.xcassets/    # App assets
```

## Commit Guidelines

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

### Commit Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that don't affect code meaning (white-space, formatting, etc.)
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to the build process or auxiliary tools

### Examples

```bash
feat(converter): add historical rate chart
fix(api): handle network timeout errors
docs(readme): update installation instructions
test(viewmodel): add tests for error handling
style(ui): improve button spacing
refactor(service): extract rate fetching logic
```

## Pull Request Process

### Before Submitting

1. Ensure your code follows the style guidelines
2. Run all tests and ensure they pass (`Cmd+U` in Xcode)
3. Add tests for new functionality
4. Update documentation if needed
5. Rebase your branch on the latest `develop`
6. Ensure the app builds and runs without errors

### Pull Request Template

When creating a PR, please include:

- **Description** - Clear description of what the PR does
- **Type of Change** - Bug fix, new feature, documentation, etc.
- **Testing** - How you tested your changes
- **Screenshots** - If UI changes are involved
- **Checklist** - Ensure all requirements are met

### Review Process

1. At least one maintainer must approve the PR
2. All CI checks must pass (when implemented)
3. No merge conflicts
4. Code must follow project standards
5. Tests must pass

### After Approval

- PRs are typically merged by maintainers
- Your branch will be deleted after merge
- Thank you for your contribution! 🎉

## Testing Guidelines

### Writing Tests

- Write unit tests for ViewModels and Services
- Use dependency injection for testable code
- Mock external dependencies (API calls, etc.)
- Test both success and failure scenarios
- Use descriptive test names

### Test Structure

```swift
func testLoadRatesSuccess() async {
    // Given
    let mockService = MockCurrencyServiceSuccess()
    let viewModel = CurrencyViewModel(service: mockService)
    
    // When
    await viewModel.loadRates()
    
    // Then
    await MainActor.run {
        XCTAssertEqual(viewModel.rates["USD"], 0.20)
        XCTAssertNil(viewModel.errorMessage)
    }
}
```

### Running Tests

```bash
# In Xcode: Cmd+U
# Command line:
xcodebuild test -scheme "Our Currency Converter" -destination "platform=iOS Simulator,name=iPhone 15"
```

## Documentation

### Code Documentation

- Add documentation comments for public APIs
- Use Swift documentation format
- Include parameter descriptions and return values
- Provide usage examples when helpful

```swift
/// Fetches current exchange rates from the API
/// - Returns: Dictionary mapping currency codes to exchange rates
/// - Throws: NetworkError if the request fails
func fetchRates() async throws -> [String: Double]
```

### README Updates

- Keep README.md up to date with new features
- Update screenshots when UI changes
- Add new dependencies to the tech stack section

## Recognition

Contributors are recognized in:
- README.md contributors section
- Release notes for significant contributions
- Special recognition for long-term contributors

## API Key Management

When contributing:
- Never commit actual API keys
- Use placeholder text like "YOUR_API_KEY_HERE"
- Add instructions for obtaining API keys
- Consider using environment variables for keys

## Questions?

Feel free to:
- Open a GitHub Discussion
- Create an issue with the `question` label
- Contact maintainers directly

Thank you for contributing to Our Currency Converter! 💱