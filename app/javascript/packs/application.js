import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
import { initSweetalert } from '../components/init_sweetalert';
// MAP
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initAutocomplete } from '../components/init_autocomplete';


// loadDynamicBannerText();

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

initMapbox();
loadDynamicBannerText();
initAutocomplete ();

// initSweetalert('#sweet-alert-green', {
//   title: "A nice alert",
//   text: "This is a great alert, isn't it?",
//   icon: "success"
// }, (value) => {
//   console.log(value);
// });

