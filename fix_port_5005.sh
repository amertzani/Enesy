#!/bin/bash

# Quick fix script to free up port 5005

echo "🔍 Checking what's using port 5005..."

PIDS=$(lsof -ti:5005)

if [ -z "$PIDS" ]; then
    echo "✅ Port 5005 is free!"
    exit 0
fi

echo "⚠️  Found processes using port 5005: $PIDS"
echo ""
echo "Processes:"
lsof -i:5005
echo ""
read -p "Kill these processes? (y/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🛑 Killing processes..."
    echo $PIDS | xargs kill -9
    sleep 1
    
    # Check if port is now free
    if lsof -ti:5005 > /dev/null 2>&1; then
        echo "⚠️  Some processes may still be running. Trying force kill..."
        echo $PIDS | xargs kill -9 2>/dev/null || true
    fi
    
    if lsof -ti:5005 > /dev/null 2>&1; then
        echo "❌ Could not free port 5005. You may need to restart your Mac or manually kill processes."
    else
        echo "✅ Port 5005 is now free!"
        echo ""
        echo "You can now start the frontend:"
        echo "  cd RandDKnowledgeGraph && npm run dev"
    fi
else
    echo "ℹ️  Not killing processes. You can manually kill them with:"
    echo "   kill -9 $PIDS"
    echo ""
    echo "Or use a different port:"
    echo "   PORT=5006 npm run dev"
fi

