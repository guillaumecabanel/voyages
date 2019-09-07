mapboxgl.accessToken = 'pk.eyJ1IjoiZ3VpZ3VpIiwiYSI6Im5ibEo4MWMifQ.pKwNm55XvYIIYHWSLgLqKg';

const set_maps = () => {
  const maps = document.querySelectorAll('.map');
  
  maps.forEach((mapHTML) => {
    mapHTML.style.height = '300px';
    mapHTML.classList.add("my-4", "mx-auto");
    const coordinates = [mapHTML.dataset.lat, mapHTML.dataset.lng];
    const map = new mapboxgl.Map({
      container: mapHTML,
      style: 'mapbox://styles/mapbox/streets-v11',
      center: coordinates,
      zoom: 10
    });
    
    new mapboxgl.Marker()
      .setLngLat(coordinates)
      .addTo(map);
  });
}

document.addEventListener('DOMContentLoaded', (event) => {
  set_maps();
})
