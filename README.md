# XSS Automation Testing Tool

![Version](https://img.shields.io/badge/version-1.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

A comprehensive automation tool for XSS vulnerability discovery and testing in web applications. This tool combines multiple reconnaissance and scanning techniques to identify potential XSS vulnerabilities in a target domain.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [How It Works](#how-it-works)
- [Project Structure](#project-structure)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

This XSS Automation Testing Tool automates the process of discovering subdomains, identifying live web services, crawling for endpoints, filtering for potential XSS injection points, and testing those points for vulnerabilities. The tool produces an elegant HTML report summarizing the findings.

## Features

- **Subdomain Discovery**: Uses `subfinder` to discover all subdomains of a target domain
- **Live Subdomain Verification**: Custom HTTP/HTTPS verification without relying on `httpx`
- **Endpoint Crawling**: Uses `katana` to discover endpoints across all live subdomains
- **Parameter Filtering**: Automatically filters endpoints containing URL parameters
- **XSS Vulnerability Testing**: Tests filtered endpoints using XSSNOVA (XSStrike)
- **Animated Progress**: Displays spinners and progress bars during scanning operations
- **Comprehensive HTML Report**: Generates a professional HTML report with statistics and findings
- **Terminal UI**: Color-coded terminal output with clear status indicators

## Prerequisites

The following tools must be installed on your system:

- Bash (Linux environment)
- `curl`
- `subfinder` (https://github.com/projectdiscovery/subfinder)
- `katana` (https://github.com/projectdiscovery/katana)
- `XSSNOVA` (renamed XSStrike - https://github.com/s0md3v/XSStrike)
- Python 3 (for running XSSNOVA)

## Installation

1. Clone this repository:
```bash
git clone https://github.com/medjahdi/xss-automation-tool.git
cd xss-automation-tool
```

2. Make the scripts executable:
```bash
chmod +x setup.sh xss_auto_scan.sh
```

3. Run the setup script to verify and install dependencies:
```bash
./setup.sh
```

4. If you don't have XSSNOVA (XSStrike) yet:
```bash
git clone https://github.com/s0md3v/XSStrike.git XSSNOVA
```

## Usage

Run the tool with a target domain:

```bash
./xss_auto_scan.sh example.com
```

The tool will:
1. Display a banner with tool information
2. Discover subdomains of the target domain
3. Check which subdomains are live
4. Crawl live subdomains for endpoints
5. Filter endpoints with parameters
6. Test filtered endpoints for XSS vulnerabilities
7. Generate an HTML report with the results

## How It Works

The tool follows this workflow:

1. **Subdomain Discovery**:
   - Uses `subfinder` to enumerate all subdomains
   - Saves results to `{domain.com}_subdomain_results.txt`

2. **Live Subdomain Verification**:
   - Tests each subdomain with both HTTP and HTTPS protocols
   - Records only responsive subdomains to `{domain.com}_clean_livesubs.txt`

3. **Endpoint Discovery**:
   - Uses `katana` to crawl each live subdomain
   - Saves all discovered URLs to `{domain.com}_endpoints.txt`

4. **Parameter Filtering**:
   - Filters endpoints containing URL parameters (with "?")
   - Saves potential XSS targets to `{domain.com}_xssnova.txt`

5. **XSS Testing**:
   - Tests each URL with XSSNOVA
   - Logs results to `{domain.com}_xss_results.txt`

6. **Report Generation**:
   - Creates a comprehensive HTML report with all findings
   - Saves it as `{domain.com}_xss_report.html`

## Project Structure

```
xss-automation-tool/
├── xss_auto_scan.sh      # Main script
├── setup.sh              # Setup verification script
├── results/              # Directory containing all scan results
│   ├── *_subdomain_results.txt
│   ├── *_clean_livesubs.txt
│   ├── *_endpoints.txt
│   ├── *_xssnova.txt
│   ├── *_xss_results.txt
│   └── *_xss_report.html
└── XSSNOVA/              # Directory containing the XSSNOVA tool
```

## Customization

You can customize the tool by modifying `xss_auto_scan.sh`:

- **HTML Report Design**: Edit the HTML/CSS in the `generate_report()` function
- **Request Timing**: Adjust timeouts in the `check_url_alive()` function
- **Animation Speed**: Modify the sleep times in animation functions
- **Additional Filters**: Add or modify grep patterns in the `filter_endpoints()` function
- **Test Parameters**: Modify XSSNOVA command line options in `test_xss_vulnerabilities()`

## Troubleshooting

**Common Issues:**

1. **Permission Denied Errors**:
   ```bash
   chmod +x xss_auto_scan.sh setup.sh
   ```

2. **Tool Not Found Errors**:
   Ensure that all required tools are installed and in your PATH.
   ```bash
   which subfinder katana
   ```

3. **Scan Taking Too Long**:
   For large domains, you can adjust the timeout values in `check_url_alive()` function.

4. **Empty Results**:
   - Check if the target domain is accessible
   - Verify your internet connection
   - Try running individual tools manually to debug

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

Created by medjahdii - June 2025
