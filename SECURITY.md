# Security Policy

## Supported Versions

We currently support the following versions with security updates:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

**Note**: As this project is in active development, we recommend using only the latest released version.

## Reporting a Vulnerability

While Our Currency Converter is not a security-critical application, we understand our responsibility as an open source project to address security concerns when they arise.

### How to Report

**Please do not report security vulnerabilities through public GitHub issues.**

Instead, please report them via email to: fulvioleo.dev@pm.me

Please include the following information in your report:
- Type of issue (e.g., potential data exposure, network security, etc.)
- Full paths of source file(s) related to the manifestation of the issue
- The location of the affected source code (tag/branch/commit or direct URL)
- Any special configuration required to reproduce the issue
- Step-by-step instructions to reproduce the issue
- Proof-of-concept or exploit code (if possible)
- Impact of the issue, including how an attacker might exploit the issue

### What to Expect

- We will review and respond to vulnerability reports on a best-effort basis
- We will work with you to understand and validate the vulnerability when possible
- We will credit you in our security advisory (unless you prefer to remain anonymous)

### Security Update Process

When security issues are confirmed, we will:
1. Assess the severity and impact of the vulnerability
2. Develop and test appropriate fixes
3. Release updates as feasible
4. Publish security advisories when appropriate

## Security Considerations

### API Keys
- Never commit API keys to the repository
- Use environment variables or secure configuration for production
- Rotate API keys regularly
- Use API keys with minimal required permissions

### Data Handling
- The app does not store sensitive personal information
- Currency conversion data is temporary and not persisted
- User preferences (selected currency) are stored locally using UserDefaults

### Network Security
- All API calls use HTTPS
- No sensitive data is transmitted
- API responses contain only public exchange rate information

### Third-Party Dependencies
- We minimize external dependencies
- Dependencies are regularly updated for security patches
- All dependencies are reviewed for security implications

## Preferred Languages

We prefer all communications to be in English or Portuguese.

## Safe Harbor

We support safe harbor for security researchers who:
- Make a good faith effort to avoid privacy violations, destruction of data, and interruption or degradation of our services
- Only interact with accounts you own or with explicit permission of the account holder
- Do not access, modify, or store user data
- Contact us immediately if you inadvertently encounter user data

## Acknowledgments

We appreciate the security research community's efforts to keep open source projects safe and secure.

Thank you for helping keep Our Currency Converter and our users safe!