#!/bin/bash

# Clear all caches and restart frontend

echo "🧹 Clearing all caches..."

cd /Users/s20/Enesy/RandDKnowledgeGraph

# Clear Vite cache
rm -rf node_modules/.vite
rm -rf dist
rm -rf .vite

echo "✅ Caches cleared!"
echo ""
echo "🔄 Now restart the frontend server:"
echo "   npm run dev"
echo ""
echo "🌐 Then in browser:"
echo "   1. Open DevTools (F12)"
echo "   2. Application tab → Clear Storage → Clear site data"
echo "   3. Hard refresh: Cmd+Shift+R"
echo "   OR use Incognito/Private window"

