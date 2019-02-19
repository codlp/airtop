import "bootstrap";

import { loadDynamicBannerText } from '../components/banner';
import { initSweetalert } from '../components/init_sweetalert';

loadDynamicBannerText();

initSweetalert('#sweet-alert-demo', {
  title: "Are you sure?",
  text: "This action cannot be reversed",
  icon: "warning"
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-link');
    link.click();
  }
});
