#!/bin/bash

# Restart Backend Server Script

echo "🛑 Stopping backend server..."

# Kill any process on port 8001
lsof -ti:8001 | xargs kill -9 2>/dev/null
sleep 2

echo "🚀 Starting backend server..."

cd /Users/s20/Enesy
source venv/bin/activate
python3 api_server.py

