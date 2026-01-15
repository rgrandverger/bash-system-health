# Linux System Health Monitor

A simple Bash script designed to monitor core system resources. I built this to practice Bash scripting, I/O redirection, and process automation in a Linux environment.

## Features
Resource Tracking: Monitors Disk Usage, RAM availability, and CPU Load Average.

Visual Alerts: Uses color-coded output (Green/Red) to highlight if resource usage exceeds certain thresholds (80% for Disk, 85% for RAM).

Automated Logging: Saves every report to `~/logs/system_health.log` using the `tee` command, keeping a persistent history of system performance.

Cron-ready: Optimized for scheduled execution.

## Setup & usage

1. Clone the repo:
```bash
git clone [https://github.com/rgrandverger/bash-system-health.git](https://github.com/rgrandverger/bash-system-health.git)
```
2. Make it executable:
```bash
chmod +x system_health.sh
```
3. Run it manually:
```bash
./system_health.sh
```
## Automation with cron

1. Open crontab:
```bash
crontab -e
```
2. Add the following line at the end (ensure the path is correct):
```bash
* * * * * /home/system_health.sh  
```
3. You can check the logs anytime with:
```bash   
cat ~/logs/system_health.log
```
## Preview
```text
=====================================
 Report: 01/15/26 17:05:22
=====================================
Disk Usage: 42% - OK
RAM Usage: 15% (13800MB free) - OK
CPU Load (1 min): 0.12
=====================================
