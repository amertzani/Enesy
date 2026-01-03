// Force favicon reload - run this in browser console
// This script removes old favicon links and adds new ones with timestamp

(function() {
  // Remove all existing favicon links
  const existingFavicons = document.querySelectorAll('link[rel*="icon"]');
  existingFavicons.forEach(link => link.remove());
  
  // Create new favicon links with timestamp
  const timestamp = Date.now();
  const faviconPath = '/logo_C.jpeg';
  
  const favicon32 = document.createElement('link');
  favicon32.rel = 'icon';
  favicon32.type = 'image/png';
  favicon32.sizes = '32x32';
  favicon32.href = `${faviconPath}?t=${timestamp}`;
  document.head.appendChild(favicon32);
  
  const favicon16 = document.createElement('link');
  favicon16.rel = 'icon';
  favicon16.type = 'image/png';
  favicon16.sizes = '16x16';
  favicon16.href = `${faviconPath}?t=${timestamp}`;
  document.head.appendChild(favicon16);
  
  const shortcutIcon = document.createElement('link');
  shortcutIcon.rel = 'shortcut icon';
  shortcutIcon.href = `${faviconPath}?t=${timestamp}`;
  document.head.appendChild(shortcutIcon);
  
  const appleTouchIcon = document.createElement('link');
  appleTouchIcon.rel = 'apple-touch-icon';
  appleTouchIcon.sizes = '180x180';
  appleTouchIcon.href = `${faviconPath}?t=${timestamp}`;
  document.head.appendChild(appleTouchIcon);
  
  console.log('✅ Favicon reloaded with timestamp:', timestamp);
  console.log('If icon still doesn\'t update, try:');
  console.log('1. Hard refresh: Cmd+Shift+R (Mac) or Ctrl+Shift+R (Windows)');
  console.log('2. Clear browser cache for localhost');
  console.log('3. Close and reopen the browser tab');
})();

