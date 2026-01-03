// Force logo reload - run this in browser console
const logo = document.querySelector('img[alt="Research Brain Logo"]');
if (logo) {
  logo.src = '/logo_C.jpeg?force=' + Date.now();
  console.log('Logo reloaded:', logo.src);
} else {
  console.log('Logo not found');
}
