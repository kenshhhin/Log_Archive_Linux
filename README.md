# Log Archive Script

## 📋 Overview

This Bash script helps manage system logs by archiving them on demand and storing them in a dedicated directory. It keeps your system clean by compressing log files and optionally allows easy scheduling using cron.

---

## ✨ Features

* **Simple CLI:** Accepts log directory as an argument.
* **Automated Archiving:** Compresses logs into `.tar.gz` format and stores them in `log_archives/`.
* **Logging:** Each archive event is recorded in `log_archive.log`.
* **Cron Integration:** Can be scheduled for automatic execution.

---

## 🌟 Benefits

* **Keeps System Clean:** Regular archiving helps save disk space and maintain system performance.
* **Easy to Use:** Simple command-line tool with minimal configuration.
* **Timestamped Backups:** Archives are clearly named with the date and time.

---

## ⚙️ Requirements

* Linux-based system
* Bash shell
* tar utility

---

## 🚀 Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/log-archive-tool.git
cd log-archive-tool
```

Make the script executable:

```bash
chmod +x log-archive.sh
```

---

## 🖥️ Usage

Run the script with `sudo` (required to access system log directories):

```bash
sudo ./log-archive.sh <log-directory>
```

Example:

```bash
sudo ./log-archive.sh /var/log
```

> ✅ The archive will be saved in `log_archives/`
> 📝 The operation will be logged in `log_archive.log`

---

## ⏲️ Optional: Cron Setup

To schedule the script for daily execution, add the following line to crontab:

```bash
sudo crontab -e
```

Example to run every day at 2 AM:

```bash
0 2 * * * /path/to/log-archive-tool/log-archive.sh /var/log
```

---

## 🛠️ How It Works

1. The script checks the provided log directory.
2. Archives all files in that directory into a timestamped `.tar.gz` file.
3. Saves the archive in `log_archives/`.
4. Logs the archive event in `log_archive.log`.

---

## 🧹 Manual Setup (if moving to system path)

You can move the script to a system directory to call it globally:

```bash
sudo mv log-archive.sh /usr/local/bin/log-archive
```

Then run it like this:

```bash
sudo log-archive /var/log
```

---

## 📝 License

This project is open source and licensed under the MIT License.
