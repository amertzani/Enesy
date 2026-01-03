// Copy and paste this entire script into your browser console (F12 → Console tab)
// Then press Enter

(function() {
  console.log('🔄 Clearing favicon cache...');
  
  // Step 1: Remove ALL existing favicon links
  const allIcons = document.querySelectorAll('link[rel*="icon"], link[rel="shortcut icon"]');
  console.log(`Found ${allIcons.length} existing favicon links`);
  allIcons.forEach(link => {
    console.log('  Removing:', link.href);
    link.remove();
  });
  
  // Step 2: Wait a moment
  setTimeout(() => {
    // Step 3: Add new favicon with fresh timestamp
    const timestamp = Date.now();
    const faviconPath = '/logo_C.jpeg';
    
    console.log(`Adding new favicon: ${faviconPath}?t=${timestamp}`);
    
    // Add multiple favicon links
    const links = [
      { rel: 'icon', type: 'image/jpeg', sizes: '32x32' },
      { rel: 'icon', type: 'image/jpeg', sizes: '16x16' },
      { rel: 'shortcut icon', type: 'image/jpeg' },
      { rel: 'apple-touch-icon', sizes: '180x180' }
    ];
    
    links.forEach(config => {
      const link = document.createElement('link');
      link.rel = config.rel;
      link.type = config.type || 'image/jpeg';
      if (config.sizes) link.sizes = config.sizes;
      link.href = `${faviconPath}?t=${timestamp}`;
      document.head.appendChild(link);
      console.log('  Added:', link.href);
    });
    
    // Step 4: Force browser to fetch the new favicon
    const img = new Image();
    img.onload = () => {
      console.log('✅ Favicon image loaded successfully!');
      console.log('🔄 Reloading page in 1 second...');
      setTimeout(() => {
        window.location.reload(true);
      }, 1000);
    };
    img.onerror = () => {
      console.error('❌ Failed to load favicon image');
      console.log('Try accessing directly: http://localhost:5006/logo_C.jpeg');
    };
    img.src = `${faviconPath}?t=${timestamp}`;
    
  }, 200);
})();

