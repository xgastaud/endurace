import Typed from 'typed.js';

function loadDynamicBannerText() {
  const banner = document.getElementById('banner-typed-text');
  if (banner) {
    new Typed('#banner-typed-text', {
      strings: ["Trouve ta prochaine épreuve"],
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
