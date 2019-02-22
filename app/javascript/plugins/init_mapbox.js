import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  console.log(markers)
  if (markers.length > 0) {
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  }
  else {
    bounds.extend([ markers.lng, markers.lat ])
  }
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/eliealn/cjsf1eadi136r1frun8ds0gga'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    if (markers.length > 0) {
      markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
      });
    } else {
      const popup = new mapboxgl.Popup().setHTML(markers.infoWindow);
      new mapboxgl.Marker()
        .setLngLat([ markers.lng, markers.lat ])
        .setPopup(popup)
        .addTo(map);
    }
  fitMapToMarkers(map, markers);
  }
};


export { initMapbox };
