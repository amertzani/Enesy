#!/bin/bash

# Clear Safari favicon cache for localhost
# Run this script, then restart Safari

echo "🧹 Clearing Safari favicon cache..."

# Clear Safari cache files related to favicons
rm -rf ~/Library/Caches/com.apple.Safari/Cache.db* 2>/dev/null
rm -rf ~/Library/Caches/com.apple.Safari/favicon* 2>/dev/null
rm -rf ~/Library/Caches/com.apple.Safari/WebKitCache/* 2>/dev/null

echo "✅ Safari cache cleared!"
echo ""
echo "📋 Next steps:"
echo "   1. Quit Safari completely (Cmd + Q)"
echo "   2. Reopen Safari"
echo "   3. Navigate to http://localhost:5006"
echo "   4. Press Cmd + Shift + R to hard refresh"
echo ""
echo "💡 Alternative: Use Private Window (Cmd + Shift + N)"

