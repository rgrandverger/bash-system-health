#!/bin/bash

LOG_DIR="/home/rikard/logs"
LOG_FILE="$LOG_DIR/system_health.log"
mkdir -p "$LOG_DIR"

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

exec > >(tee -a "$LOG_FILE")

echo -e "${YELLOW}=====================================${NC}"
echo -e "${YELLOW} Report: $(date +'%Y-%m-%d %H:%M:%S')${NC}"
echo -e "${YELLOW}=====================================${NC}"

check_disk() {
    USAGE=$(df -h / | grep / | awk '{ print $5 }' | sed 's/%//g')
    if [ "$USAGE" -gt 80 ]; then
        echo -e "Disk Usage: ${RED}${USAGE}% - CRITICAL!${NC}"
    else
        echo -e "Disk Usage: ${GREEN}${USAGE}% - OK${NC}"
    fi
}

check_ram() {
    TOTAL=$(free -m | awk '/Mem:/ { print $2 }')
    FREE=$(free -m | awk '/Mem:/ { print $4 }')
    USED_PCT=$(( 100 - (FREE * 100 / TOTAL) ))
    
    if [ "$USED_PCT" -gt 85 ]; then
        echo -e "RAM Usage: ${RED}${USED_PCT}% (${FREE}MB free)${NC}"
    else
        echo -e "RAM Usage: ${GREEN}${USED_PCT}% (${FREE}MB free)${NC}"
    fi
}

check_cpu_load() {
    LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1 | xargs)
    echo -e "CPU Load (1 min): ${GREEN}${LOAD}${NC}"
}

check_disk
check_ram
check_cpu_load

echo -e "${YELLOW}=====================================${NC}"
