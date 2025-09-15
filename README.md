# lite-webscan
It’s clean, descriptive, and reflects the lightweight nature of your script.

# 🌐 lite-webscan

A lightweight automated web reconnaissance and vulnerability scanning bash script using popular open-source tools like `subfinder`, `httpx`, and `nuclei`.

## 📋 Features

- 🔎 Subdomain enumeration via [Subfinder](https://github.com/projectdiscovery/subfinder)
- 🌐 HTTP probing via [httpx](https://github.com/projectdiscovery/httpx)
- 🚨 Vulnerability scanning with [Nuclei](https://github.com/projectdiscovery/nuclei)
- 🗂️ All output saved in structured folders

## 📦 Requirements

Make sure the following tools are installed and available in your system `$PATH`:

- [`subfinder`](https://github.com/projectdiscovery/subfinder)
- [`httpx`](https://github.com/projectdiscovery/httpx)
- [`nuclei`](https://github.com/projectdiscovery/nuclei)

You can install them using `go install`:

```bash
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

🚀 Usage
chmod +x lite-webscan.sh
./lite-webscan.sh <domain>

Example:
./lite-webscan.sh example.com

🧪 Note
This is a lightweight scanner, intended for quick initial recon. For in-depth assessments, consider extending it or integrating other tools.
