# RedTiger - XSS Automation Testing Tool

```
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⣤⣤⡴⣶⣶⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣴⣶⣿⣿⣿⣿⣿⣿⣷⣿⣶⣿⣧⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⠿⠿⠛⠛⠛⠋⠉⠉⠉⠛⠛⠛⠛⠿⠟⠛⠛⠛⠛⠛⠛⠛⠛⠛⣻⣿⣿⠋⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣟⡁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣠⣾⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠴⠿⠿⠿⣿⣿⣷⣦⡀⠀⠀⠀⠀
⠀⠀⠀⢰⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣄⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣶⣄⠀⠀
⠀⠀⠀⢸⣿⣿⣿⣦⣤⣤⣀⣀⣀⣀⣠⣤⠴⠖⠋⢉⣽⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠧⡀
⠀⠀⢠⣿⠟⠉⠁⠈⠉⠉⠙⠛⠛⠿⠿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈
⠀⢠⣿⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠽⠟⠛⠉⠀⢀⣀⣤⣴⣶⣶⣶⣶⣶⣶⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣿⣿⣿⣷⣶⣦⣤⣤⣤⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠈⠉⠛⠿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⣿⠘⢿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠈⣿⣴⣿⣿⣄⠀⠀⠀⠀⠀⠀⣀⣠⣴⠶⣿⣿⠋⠉⠉⠉⠙⢻⣿⡆⠀⠀⠀⠀⠀⠀⣀⣴⣶⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀
⠀⢹⣿⡍⠛⠻⢷⣶⣶⣶⠟⢿⣿⠗⠀⠹⠃⡀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⢀⣴⣿⣿⣿⣿⠿⠿⠛⠛⠛⠛⠛⠂⠀⠀⠀⠀⠀⠀
⠀⠀⢻⡇⠀⠀⠀⢻⣿⣿⠀⠈⠛⠀⠀⠀⢹⠇⠀⠀⠀⠀⢶⣿⠇⠀⢀⣴⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠁⠀⠀⠀⠀⠹⡇⠀⠀⠀⠀⠀⣀⡾⠀⠀⠀⠀⠀⢸⡿⠀⣠⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⣦⠀⠀⢠⣿⢳⠀⠀⠀⠙⣿⣿⠁⢰⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣿⣷⡾⠿⠃⢸⣷⣀⠀⢀⣾⠃⢀⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⠻⠷⢾⣿⣿⣷⡿⠁⠀⢸⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⢿⣷⣄⠀⠀⠉⠛⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣦⣄⡀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣶⣶⣾⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠿⠧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
```

## 🚩 Overview

RedTiger is an automated XSS (Cross-Site Scripting) vulnerability testing tool built to streamline the process of security testing. It automates four key phases: subdomain enumeration, link filtering, endpoint extraction, and XSS vulnerability scanning.

**Author:** [@medjahdi](https://github.com/medjahdi)  
**Version:** 1.0.0

## ✨ Features

- 🔍 **Comprehensive Scanning**: Subdomain discovery, link filtering, endpoint extraction, and XSS testing
- 🎯 **Intelligent Filtering**: Tests only endpoints with parameters (containing "?"), increasing efficiency
- 🖥️ **Rich Terminal UI**: Beautiful animations, progress bars, and color-coded output
- 📊 **Detailed Reporting**: Shows scan statistics and sample results in each phase
- 🔄 **Main Domain Inclusion**: Always tests the main domain even when no subdomains are found
- 🛡️ **Dependency Checking**: Ensures all required tools are available before starting

## 🔧 Requirements

RedTiger requires the following tools:

- [`subfinder`](https://github.com/projectdiscovery/subfinder) - For subdomain enumeration
- [`katana`](https://github.com/projectdiscovery/katana) - For endpoint extraction
- [`XnovaX`](https://github.com/medjahdi/XnovaX) - For filtering useful links
- [`XSSNOVA`](https://github.com/medjahdi/XSSNOVA) - For XSS vulnerability scanning

## 📦 Installation

1. Clone the repository:

```bash
git clone https://github.com/medjahdi/RedTiger.git
cd RedTiger
```

2. Make the script executable:

```bash
chmod +x redtiger.sh
```

3. Install dependencies if not already installed:

```bash
# Install subfinder
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder

# Install katana
GO111MODULE=on go get -v github.com/projectdiscovery/katana/cmd/katana
```

4. Make sure XnovaX and XSSNOVA are in their respective directories:

```
RedTiger/
├── redtiger.sh
├── XnovaX/
│   └── xnovax.py
└── XSSNOVA/
    └── xssnova.py
```

## 🚀 Usage

Run RedTiger against a target domain:

```bash
./redtiger.sh example.com
```

The tool will create a directory structure as follows:

```
example.com/
├── subdomains.txt     # All discovered subdomains
├── clean_livesubs.txt # Filtered useful links
├── endpoints.txt      # All extracted endpoints
└── attack.txt         # Endpoints with parameters for XSS testing
```

## 🔄 Workflow

1. **Subdomain Enumeration** (`subfinder`):
   - Discovers all subdomains for the target domain
   - Automatically adds the main domain for testing

2. **Link Filtering** (`XnovaX`):
   - Filters useful and live links from discovered subdomains
   - Saves the filtered links for the next phase

3. **Endpoint Extraction** (`katana`):
   - Crawls all filtered links to discover endpoints
   - Extracts all URLs and paths from the target

4. **Parameter Filtering**:
   - Selects only endpoints with parameters (containing "?")
   - Creates a focused list for efficient XSS testing

5. **XSS Testing** (`xssnova`):
   - Tests each parameterized endpoint for XSS vulnerabilities
   - Reports potential vulnerabilities

## 📷 Screenshots

![RedTiger Banner](https://github.com/medjahdi/RedTiger/blob/main/banner.png)

## 🤝 Contributing

Contributions are welcome! Feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📧 Contact

- **Author:** [@medjahdi](https://github.com/medjahdi)
- **GitHub Repository:** [https://github.com/medjahdi/RedTiger](https://github.com/medjahdi/RedTiger)

---

⚠️ **Disclaimer:** This tool is intended for ethical security testing only. Always ensure you have permission to test the target domain.
