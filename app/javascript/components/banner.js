import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const banner = document.getElementById('banner-typed-text');
  if (banner) {
    new Typed('#banner-typed-text', {
      strings: ["Paris", "London ", "New York", "Milan ", "Berlin ", "Madrid"],
      typeSpeed: 60,
      loop: true
    });
  }
};

export { loadDynamicBannerText };
