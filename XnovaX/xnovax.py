#!/usr/bin/env python3

import argparse
import concurrent.futures
import requests
from urllib.parse import urlparse
import sys
import os
from tqdm import tqdm

# Disable SSL warnings
requests.packages.urllib3.disable_warnings()

class XnovaX:
    def __init__(self, input_file, output_file, threads=10, timeout=5):
        self.input_file = input_file
        self.output_file = output_file
        self.threads = threads
        self.timeout = timeout
        self.headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        self.live_urls = []

    def check_url(self, url):
        """Check if a URL is live and reachable"""
        if not url.startswith('http'):
            # Try both http and https
            protocols = ['http://', 'https://']
        else:
            protocols = [url]
            url = url.replace('http://', '').replace('https://', '')
        
        for protocol in protocols:
            try:
                full_url = protocol + url if protocol.startswith('http') else url
                response = requests.get(full_url, headers=self.headers, timeout=self.timeout, verify=False, allow_redirects=True)
                
                if response.status_code < 400:  # Consider 2xx and 3xx as success
                    return full_url
            except requests.exceptions.RequestException:
                continue
        
        return None

    def process_input(self):
        """Process the input file and check each URL"""
        with open(self.input_file, 'r') as f:
            domains = [line.strip() for line in f if line.strip()]
        
        print(f"[*] Found {len(domains)} domains in the input file")
        print(f"[*] Checking for live URLs with {self.threads} threads...")
        
        with concurrent.futures.ThreadPoolExecutor(max_workers=self.threads) as executor:
            results = list(tqdm(executor.map(self.check_url, domains), total=len(domains), desc="Checking URLs"))
        
        # Filter out None results
        self.live_urls = [url for url in results if url]
        
        print(f"[+] Found {len(self.live_urls)} live URLs")

    def save_output(self):
        """Save live URLs to the output file"""
        with open(self.output_file, 'w') as f:
            for url in self.live_urls:
                f.write(f"{url}\n")
        
        print(f"[+] Live URLs saved to {self.output_file}")

    def run(self):
        """Main execution method"""
        print("[*] Starting XnovaX - URL filtering tool")
        
        if not os.path.exists(self.input_file):
            print(f"[-] Input file not found: {self.input_file}")
            sys.exit(1)
        
        self.process_input()
        self.save_output()
        print("[+] XnovaX completed successfully")

def main():
    parser = argparse.ArgumentParser(description='XnovaX - A tool for filtering useful links')
    parser.add_argument('--input', '-i', required=True, help='Input file containing a list of domains or URLs')
    parser.add_argument('--output', '-o', required=True, help='Output file to save live URLs')
    parser.add_argument('--threads', '-t', type=int, default=10, help='Number of threads (default: 10)')
    parser.add_argument('--timeout', type=int, default=5, help='Timeout in seconds for HTTP requests (default: 5)')
    
    args = parser.parse_args()
    
    tool = XnovaX(args.input, args.output, args.threads, args.timeout)
    tool.run()

if __name__ == "__main__":
    main()