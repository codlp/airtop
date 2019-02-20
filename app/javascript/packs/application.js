import "../plugins/flatpickr"

import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
import { initSweetalert } from '../components/init_sweetalert';
// MAP
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

initMapbox();

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