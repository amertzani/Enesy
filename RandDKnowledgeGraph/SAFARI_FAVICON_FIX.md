# Safari Favicon Cache Fix

Safari caches favicons very aggressively. Here are Safari-specific solutions:

## Method 1: Enable Develop Menu (Recommended)

1. **Enable Develop Menu:**
   - Safari → Settings → Advanced
   - Check "Show Develop menu in menu bar"

2. **Disable Cache:**
   - Develop → Disable Caches
   - Keep this checked while testing

3. **Hard Reload:**
   - Cmd + Option + R (or Develop → Empty Caches)
   - Then Cmd + Shift + R to reload

## Method 2: Clear Safari Cache Manually

1. **Safari → Settings → Privacy**
2. Click **"Manage Website Data..."**
3. Search for "localhost"
4. Select and click **"Remove"**
5. Close Safari completely (Cmd + Q)
6. Reopen Safari and navigate to localhost:5006

## Method 3: Use Private Window

1. File → New Private Window (Cmd + Shift + N)
2. Navigate to http://localhost:5006
3. This bypasses all cache

## Method 4: Terminal Command (Nuclear Option)

Run this in Terminal to clear Safari's favicon cache:

```bash
rm -rf ~/Library/Caches/com.apple.Safari/Cache.db*
rm -rf ~/Library/Caches/com.apple.Safari/favicon*
```

Then restart Safari.

## Method 5: Run Script in Console

1. Open your app in Safari
2. Press Cmd + Option + I (or Develop → Show JavaScript Console)
3. Paste and run the script from `force_favicon_now.js`

