#!/bin/bash
set -e

REPO_DIR="/workspace/8_trade"
LOG_FILE="/home/luis/trade-history-commit.log"
COMMIT_MSG="Updated trade history by Odin"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting commit" >> "$LOG_FILE"

cd "$REPO_DIR"

git add docs/trade-history.md

if git diff --cached --quiet; then
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] No changes to commit" >> "$LOG_FILE"
else
  git commit -m "$COMMIT_MSG" >> "$LOG_FILE" 2>&1
  git push origin main >> "$LOG_FILE" 2>&1
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] Commit and push successful" >> "$LOG_FILE"
fi
