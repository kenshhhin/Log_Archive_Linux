#!/bin/bash

# Get the log directory from the first argument
LOG_DIR=$1

# Check if the argument is provided
if [ -z "$LOG_DIR" ]; then
  echo "❌ Please provide the log directory: ./log-archive.sh <log-directory>"
  exit 1
fi

# Check if the provided directory exists
if [ ! -d "$LOG_DIR" ]; then
  echo "❌ The directory $LOG_DIR does not exist."
  exit 1
fi

echo "✅ Directory found: $LOG_DIR"

# Define the archive directory name
ARCHIVE_DIR="log_archives"

# Check if the archive directory exists, if not, create it
if [ ! -d "$ARCHIVE_DIR" ]; then
  mkdir "$ARCHIVE_DIR"
  echo "✅ Archive directory created: $ARCHIVE_DIR"
else
  echo "ℹ️ Archive directory already exists: $ARCHIVE_DIR"
fi

# Generate current timestamp in the format YYYYMMDD_HHMMSS
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create the archive file name using the timestamp
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

echo "📦 Archive will be created: ${ARCHIVE_DIR}/${ARCHIVE_NAME}"

# Compress the logs into the archive
tar -czf "${ARCHIVE_DIR}/${ARCHIVE_NAME}" -C "$LOG_DIR" .

echo "✅ Logs successfully archived to ${ARCHIVE_DIR}/${ARCHIVE_NAME}"

# Write the archive event to the log file
echo "$(date +"%Y-%m-%d %H:%M:%S") - Archived to ${ARCHIVE_DIR}/${ARCHIVE_NAME}" >> log_archive.log

echo "📝 Archive event logged in log_archive.log"

