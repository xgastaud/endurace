import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Trouve ta prochaine épreuve"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
