#!/bin/bash

# RedTiger - XSS Automation Testing Tool
# Author: @medjahdi
# GitHub: github.com/medjahdi
# Version: 1.0.0

# Colors for better output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
NC='\033[0m' # No Color

# Get current user and time
CURRENT_USER=$(whoami)
CURRENT_DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Animation frames
spinner=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
loading_bar=('▏' '▎' '▍' '▌' '▋' '▊' '▉' '█')

# Display banner function
display_banner() {
  echo -e "${RED}"
  echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⣤⣤⡴⣶⣶⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣴⣶⣿⣿⣿⣿⣿⣿⣷⣿⣶⣿⣧⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⠿⠿⠛⠛⠛⠋⠉⠉⠉⠛⠛⠛⠛⠿⠟⠛⠛⠛⠛⠛⠛⠛⠛⠛⣻⣿⣿⠋⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣟⡁⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⠀⠀⠀⣠⣾⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠴⠿⠿⠿⣿⣿⣷⣦⡀⠀⠀⠀⠀"
  echo -e "⠀⠀⠀⢰⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣄⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣶⣄⠀⠀"
  echo -e "⠀⠀⠀⢸⣿⣿⣿⣦⣤⣤⣀⣀⣀⣀⣠⣤⠴⠖⠋⢉⣽⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠧⡀"
  echo -e "⠀⠀⢠⣿⠟⠉⠁⠈⠉⠉⠙⠛⠛⠿⠿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈"
  echo -e "⠀⢠⣿⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠽⠟⠛⠉⠀⢀⣀⣤⣴⣶⣶⣶⣶⣶⣶⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⣿⣿⣿⣷⣶⣦⣤⣤⣤⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠈⠉⠛⠿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⢸⣿⠘⢿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠈⣿⣴⣿⣿⣄⠀⠀⠀⠀⠀⠀⣀⣠⣴⠶⣿⣿⠋⠉⠉⠉⠙⢻⣿⡆⠀⠀⠀⠀⠀⠀⣀⣴⣶⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⢹⣿⡍⠛⠻⢷⣶⣶⣶⠟⢿⣿⠗⠀⠹⠃⡀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⢀⣴⣿⣿⣿⣿⠿⠿⠛⠛⠛⠛⠛⠂⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⠀⢻⡇⠀⠀⠀⢻⣿⣿⠀⠈⠛⠀⠀⠀⢹⠇⠀⠀⠀⠀⢶⣿⠇⠀⢀⣴⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⠀⠀⠁⠀⠀⠀⠀⠹⡇⠀⠀⠀⠀⠀⣀⡾⠀⠀⠀⠀⠀⢸⡿⠀⣠⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⣦⠀⠀⢠⣿⢳⠀⠀⠀⠙⣿⣿⠁⢰⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣿⣷⡾⠿⠃⢸⣷⣀⠀⢀⣾⠃⢀⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⠻⠷⢾⣿⣿⣷⡿⠁⠀⢸⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⢿⣷⣄⠀⠀⠉⠛⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣦⣄⡀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣶⣶⣾⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠿⠧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${NC}"
  echo
  echo -e "${YELLOW}${BOLD}RedTiger${NC} - ${CYAN}XSS Automation Testing Tool${NC}"
  echo -e "${MAGENTA}┌─────────────────────────────────────────────────────┐${NC}"
  echo -e "${MAGENTA}│${NC} Author: ${BLUE}@medjahdi${NC}                                   ${MAGENTA}│${NC}"
  echo -e "${MAGENTA}│${NC} GitHub: ${BLUE}github.com/medjahdi${NC}                         ${MAGENTA}│${NC}"
  echo -e "${MAGENTA}│${NC} Version: ${GREEN}1.0.0${NC}                                      ${MAGENTA}│${NC}"
  echo -e "${MAGENTA}│${NC} Date: ${CYAN}$CURRENT_DATE${NC}                           ${MAGENTA}│${NC}"
  echo -e "${MAGENTA}│${NC} User: ${YELLOW}$CURRENT_USER${NC}                                          ${MAGENTA}│${NC}"
  echo -e "${MAGENTA}└─────────────────────────────────────────────────────┘${NC}"
  echo
}

# Enhanced spinner animation function
advanced_spinner() {
  local pid=$1
  local message=$2
  local i=0
  local delay=0.1
  
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    printf " ${GREEN}[%s]${NC} %s" "${spinner[i]}" "$message"
    i=$(( (i+1) % ${#spinner[@]} ))
    sleep $delay
    printf "\r"
  done
  
  printf " ${GREEN}[✓]${NC} %s\n" "$message"
}

# Loading bar animation function
loading_progress() {
  local pid=$1
  local message=$2
  local width=30
  local i=0
  local delay=0.2
  
  printf " ${BLUE}[${NC} ${message}"
  
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    local bar=""
    local progress=$(( i % width ))
    
    for ((j=0; j<width; j++)); do
      if [ $j -lt $progress ]; then
        bar="${bar}${loading_bar[7]}"
      elif [ $j -eq $progress ]; then
        bar="${bar}${loading_bar[i % ${#loading_bar[@]}]}"
      else
        bar="${bar} "
      fi
    done
    
    printf "\r ${BLUE}[${NC} ${message} ${YELLOW}${bar}${NC} ${BLUE}]${NC}"
    i=$((i+1))
    sleep $delay
  done
  
  # Fill the bar completely when done
  local full_bar=""
  for ((j=0; j<width; j++)); do
    full_bar="${full_bar}${loading_bar[7]}"
  done
  
  printf "\r ${BLUE}[${NC} ${message} ${GREEN}${full_bar}${NC} ${BLUE}]${NC} ${GREEN}✓${NC}\n"
}

# Display progress percentage
show_progress() {
  local current=$1
  local total=$2
  local task=$3
  local percent=$(( current * 100 / total ))
  local bar_size=20
  local bar_filled=$(( bar_size * current / total ))
  local bar=""
  
  for ((i=0; i<bar_size; i++)); do
    if [ $i -lt $bar_filled ]; then
      bar="${bar}█"
    else
      bar="${bar}░"
    fi
  done
  
  printf " ${BLUE}[${GREEN}%3d%%${BLUE}]${NC} ${YELLOW}[${NC}${CYAN}%s${NC}${YELLOW}]${NC} %s\n" "$percent" "$bar" "$task"
}

# Print section header
section_header() {
  local title=$1
  local width=50
  local padding=$(( (width - ${#title}) / 2 ))
  
  echo
  echo -e "${YELLOW}┌$( printf '─%.0s' $(seq 1 $width) )┐${NC}"
  echo -e "${YELLOW}│$( printf ' %.0s' $(seq 1 $padding) )${CYAN}${BOLD}$title${NC}${YELLOW}$( printf ' %.0s' $(seq 1 $padding) )│${NC}"
  echo -e "${YELLOW}└$( printf '─%.0s' $(seq 1 $width) )┘${NC}"
}

# Check for dependencies
check_dependencies() {
  section_header "CHECKING DEPENDENCIES   "
  
  local missing_deps=()
  local dependencies=("subfinder" "XnovaX/xnovax.py" "katana" "XSSNOVA/xssnova.py")
  local descriptions=("Subdomain finder" "Link filter tool" "Endpoint extractor" "XSS scanner")
  
  for i in "${!dependencies[@]}"; do
    printf " ${BLUE}[${NC}${YELLOW}CHECKING${NC}${BLUE}]${NC} %-25s " "${descriptions[$i]}"
    
    if [[ "${dependencies[$i]}" == *"/"* ]]; then
      if [ -f "${dependencies[$i]}" ]; then
        echo -e "${GREEN}FOUND${NC}"
      else
        echo -e "${RED}MISSING${NC}"
        missing_deps+=("${dependencies[$i]}")
      fi
    else
      if command -v ${dependencies[$i]} >/dev/null 2>&1; then
        echo -e "${GREEN}FOUND${NC}"
      else
        echo -e "${RED}MISSING${NC}"
        missing_deps+=("${dependencies[$i]}")
      fi
    fi
    sleep 0.2
  done
  
  if [ ${#missing_deps[@]} -ne 0 ]; then
    echo
    echo -e "${RED}${BOLD}Error: Missing dependencies${NC}"
    echo -e "Please make sure the following tools are installed:"
    for dep in "${missing_deps[@]}"; do
      echo -e " ${RED}•${NC} $dep"
    done
    exit 1
  else
    echo
    echo -e " ${GREEN}${BOLD}All dependencies are installed! ✓${NC}"
  fi
}

# Check proper usage
if [ $# -ne 1 ]; then
  display_banner
  echo -e "${YELLOW}${BOLD}Usage:${NC} $0 ${CYAN}domain.com${NC}"
  echo
  echo -e "${BLUE}Example:${NC}"
  echo -e "  $0 example.com"
  exit 1
fi

# Set target domain
TARGET=$1

# Display banner
clear
display_banner

# Check dependencies
check_dependencies

# Create target directory
mkdir -p "$TARGET"

section_header "STARTING SCAN"
echo -e " ${BLUE}[*]${NC} Target: ${YELLOW}${BOLD}$TARGET${NC}"
echo -e " ${BLUE}[*]${NC} Results will be saved in ${YELLOW}$TARGET/${NC} directory"

# Step 1: Subdomain enumeration
section_header "PHASE 1: SUBDOMAIN ENUMERATION"
echo -e " ${BLUE}[*]${NC} Extracting subdomains for ${CYAN}$TARGET${NC}"

# Launch process in background and show progress bar
subfinder -d "$TARGET" -o "$TARGET/subdomains.txt" > /dev/null 2>&1 &
loading_progress $! "Scanning subdomains"

# Check if subdomains were found, if not, add the main domain
if [ ! -f "$TARGET/subdomains.txt" ] || [ ! -s "$TARGET/subdomains.txt" ]; then
  echo -e " ${YELLOW}[!]${NC} No subdomains found for $TARGET"
  echo -e " ${BLUE}[*]${NC} Adding main domain for testing"
  echo "$TARGET" > "$TARGET/subdomains.txt"
  SUBDOMAINS_COUNT=1
else
  SUBDOMAINS_COUNT=$(wc -l < "$TARGET/subdomains.txt")
  
  # Make sure main domain is included in the list
  if ! grep -q "^$TARGET$" "$TARGET/subdomains.txt"; then
    echo "$TARGET" >> "$TARGET/subdomains.txt"
    SUBDOMAINS_COUNT=$((SUBDOMAINS_COUNT+1))
    echo -e " ${BLUE}[*]${NC} Added main domain to the list"
  fi
fi

echo -e " ${GREEN}[+]${NC} Processing ${YELLOW}${BOLD}$SUBDOMAINS_COUNT${NC} domains"

# Show a sample of domains (max 5)
echo -e " ${BLUE}[*]${NC} Sample domains:"
head -n 5 "$TARGET/subdomains.txt" | while read domain; do
  echo -e "     ${CYAN}•${NC} $domain"
done

if [ $SUBDOMAINS_COUNT -gt 5 ]; then
  echo -e "     ${YELLOW}•${NC} ... and $(($SUBDOMAINS_COUNT - 5)) more"
fi

# Step 2: Filter useful links
section_header "PHASE 2: FILTERING USEFUL LINKS"
echo -e " ${BLUE}[*]${NC} Filtering useful links from ${CYAN}$SUBDOMAINS_COUNT${NC} domains"

# Launch process in background and show advanced spinner
python XnovaX/xnovax.py --input "$TARGET/subdomains.txt" --output "$TARGET/clean_livesubs.txt" > /dev/null 2>&1 &
advanced_spinner $! "Filtering useful links"

# Check if any useful links were found
if [ ! -f "$TARGET/clean_livesubs.txt" ] || [ ! -s "$TARGET/clean_livesubs.txt" ]; then
  echo -e " ${RED}[!]${NC} ${BOLD}No useful links found${NC}"
  exit 1
fi

LINKS_COUNT=$(wc -l < "$TARGET/clean_livesubs.txt")
echo -e " ${GREEN}[+]${NC} Found ${YELLOW}${BOLD}$LINKS_COUNT${NC} useful links"

# Show a sample of links (max 3)
echo -e " ${BLUE}[*]${NC} Sample links:"
head -n 3 "$TARGET/clean_livesubs.txt" | while read link; do
  echo -e "     ${CYAN}•${NC} $link"
done

if [ $LINKS_COUNT -gt 3 ]; then
  echo -e "     ${YELLOW}•${NC} ... and $(($LINKS_COUNT - 3)) more"
fi

# Step 3: Extract endpoints
section_header "PHASE 3: ENDPOINT EXTRACTION"
echo -e " ${BLUE}[*]${NC} Extracting endpoints from ${CYAN}$LINKS_COUNT${NC} links"

# Launch process in background and show loading progress
katana -list "$TARGET/clean_livesubs.txt" -o "$TARGET/endpoints.txt" > /dev/null 2>&1 &
loading_progress $! "Extracting endpoints"

# Check if endpoints were found
if [ ! -f "$TARGET/endpoints.txt" ] || [ ! -s "$TARGET/endpoints.txt" ]; then
  echo -e " ${RED}[!]${NC} ${BOLD}No endpoints found${NC}"
  exit 1
fi

ENDPOINTS_COUNT=$(wc -l < "$TARGET/endpoints.txt")
echo -e " ${GREEN}[+]${NC} Found ${YELLOW}${BOLD}$ENDPOINTS_COUNT${NC} endpoints"

# Step 3.5: Filter endpoints for those containing '?' (indicating parameters)
echo -e " ${BLUE}[*]${NC} Filtering endpoints with parameters for XSS testing"

grep "?" "$TARGET/endpoints.txt" > "$TARGET/attack.txt" || true

# Check if parameterized endpoints were found
ATTACK_COUNT=0
if [ -f "$TARGET/attack.txt" ] && [ -s "$TARGET/attack.txt" ]; then
  ATTACK_COUNT=$(wc -l < "$TARGET/attack.txt")
  echo -e " ${GREEN}[+]${NC} Found ${YELLOW}${BOLD}$ATTACK_COUNT${NC} endpoints with parameters for XSS testing"
  
  # Show a sample of endpoints with parameters (max 3)
  echo -e " ${BLUE}[*]${NC} Sample endpoints with parameters:"
  head -n 3 "$TARGET/attack.txt" | while read endpoint; do
    echo -e "     ${CYAN}•${NC} $endpoint"
  done
  
  if [ $ATTACK_COUNT -gt 3 ]; then
    echo -e "     ${YELLOW}•${NC} ... and $(($ATTACK_COUNT - 3)) more"
  fi
else
  echo -e " ${YELLOW}[!]${NC} No endpoints with parameters found for XSS testing"
  echo -e " ${BLUE}[*]${NC} Creating empty attack.txt file"
  touch "$TARGET/attack.txt"
fi

# Step 4: XSS attack testing
section_header "PHASE 4: XSS VULNERABILITY TESTING"
echo -e " ${BLUE}[*]${NC} Attacking ${CYAN}$ATTACK_COUNT${NC} endpoints for XSS vulnerabilities"

if [ $ATTACK_COUNT -eq 0 ]; then
  echo -e " ${YELLOW}[!]${NC} ${BOLD}No endpoints with parameters available for XSS testing${NC}"
else
  echo -e " ${YELLOW}╔════════════════════════════════════════════════════════╗${NC}"
  echo -e " ${YELLOW}║${NC} ${CYAN}${BOLD} XSS Vulnerability Testing in Progress ${NC}              ${YELLOW}║${NC}"
  echo -e " ${YELLOW}╚════════════════════════════════════════════════════════╝${NC}"
  echo
  
  COUNTER=0
  
  while IFS= read -r url; do
    COUNTER=$((COUNTER+1))
    show_progress $COUNTER $ATTACK_COUNT "Testing: $url"
    python XSSNOVA/xssnova.py -u "$url" --skip
    echo -e " ${YELLOW}─────────────────────────────────────────────────────${NC}"
  done < "$TARGET/attack.txt"
  
  echo -e " ${GREEN}[✓]${NC} ${BOLD}XSS scan completed${NC}"
fi

# Final summary
section_header "SCAN SUMMARY"
echo -e " ${GREEN}${BOLD}RedTiger XSS Scan Results for ${YELLOW}$TARGET${NC}"
echo
echo -e " ${BLUE}┌─────────────────────────────────────────┐${NC}"
echo -e " ${BLUE}│${NC} ${CYAN}METRIC${NC}                  ${BLUE}│${NC} ${YELLOW}COUNT${NC}          ${BLUE}│${NC}"
echo -e " ${BLUE}├─────────────────────────────────────────┤${NC}"
echo -e " ${BLUE}│${NC} Domains scanned           ${BLUE}│${NC} ${YELLOW}$SUBDOMAINS_COUNT${NC}              ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC} Useful links found        ${BLUE}│${NC} ${YELLOW}$LINKS_COUNT${NC}              ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC} Total endpoints extracted ${BLUE}│${NC} ${YELLOW}$ENDPOINTS_COUNT${NC}             ${BLUE}│${NC}"
echo -e " ${BLUE}│${NC} Parameters tested for XSS ${BLUE}│${NC} ${YELLOW}$ATTACK_COUNT${NC}              ${BLUE}│${NC}"
echo -e " ${BLUE}└─────────────────────────────────────────┘${NC}"
echo
echo -e " ${BLUE}All results saved in:${NC} ${YELLOW}$TARGET/${NC} directory"
echo
echo -e " ${GREEN}${BOLD}Thank you for using RedTiger XSS Automation Tool${NC}"
echo -e " ${BLUE}Scan completed at:${NC} $(date +"%Y-%m-%d %H:%M:%S")"
echo