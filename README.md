# Linux System Health Monitor

A simple Bash script designed to monitor core system resources. I built this to practice Bash scripting, I/O redirection, and process automation in a Linux environment.

## Features
Resource Tracking: Monitors Disk Usage, RAM availability, and CPU Load Average.

Visual Alerts: Uses color-coded output (Green/Red) to highlight if resource usage exceeds certain thresholds (80% for Disk, 85% for RAM).

Automated Logging: Saves every report to `~/logs/system_health.log` using the `tee` command, keeping a persistent history of system performance.

Cron-ready: Optimized for scheduled execution.

Setup & Usage

    Clone the repo:
    Bash

    git clone [https://github.com/rgrandverger/bash-system-health.git](https://github.com/rgrandverger/bash-system-health.git)

    Make it executable:
    Bash

    chmod +x system_health.sh

    Run it manually:
    Bash

    ./system_health.sh

Automation with Cron

To set up automated monitoring (e.g., every minute), you can add this script to your crontab:

    Open crontab:
    Bash

    crontab -e

    Add the following line at the end (ensure the path is correct):
    Bash

    * * * * * /home/rikard/system_health.sh

    You can check the logs anytime with:
    Bash

    cat ~/logs/system_health.log

## Preview
```text
=====================================
 Report: 01/15/26 17:05:22
=====================================
Disk Usage: 42% - OK
RAM Usage: 15% (13800MB free) - OK
CPU Load (1 min): 0.12
=====================================
