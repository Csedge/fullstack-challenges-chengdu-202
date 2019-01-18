import mapboxgl from 'mapbox-gl';

// TODO: Put your JS code in here


import mapboxgl from 'mapbox-gl';

const button = document.querySelector(".btn-primary")
button.addEventListener("click", () => {
  let location = document.querySelector("#input").value
  const key = 'pk.eyJ1IjoiZWxsZXJ5bGkiLCJhIjoiY2pvaTJjMjRsMDRvYzNwdDZzcG15M2V1OSJ9.tGVdqK-172exvdrohQ5dcwpk.eyJ1IjoiZWxsZXJ5bGkiLCJhIjoiY2pvaTJjMjRsMDRvYzNwdDZzcG15M2V1OSJ9.tGVdqK-172exvdrohQ5dcw'
  fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${location}.json?access_token=${key}`)
  .then(response => response.json())
  .then((data) => {
    const geoLocation = `${data.features[0].center[0]} ${data.features[0].center[1]}`
      document.querySelector("#GPS").innerText = geoLocation;


      mapboxgl.accessToken = key;
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10',
        center: [ data.features[0].center[0], data.features[0].center[1] ],
        zoom: 12
      });
      new mapboxgl.Marker()
        .setLngLat([ data.features[0].center[0], data.features[0].center[1] ])
        .addTo(map);
    });
});


// new mapboxgl.Marker()
//   .setLngLat([ -0.077, 51.533 ])
//   .addTo(map);

// var mapboxgl = require('mapbox-gl/dist/mapbox-gl.js');

// mapboxgl.accessToken = 'pk.eyJ1IjoiZWxsZXJ5bGkiLCJhIjoiY2pvaTJjMjRsMDRvYzNwdDZzcG15M2V1OSJ9.tGVdqK-172exvdrohQ5dcwpk.eyJ1IjoiZWxsZXJ5bGkiLCJhIjoiY2pvaTJjMjRsMDRvYzNwdDZzcG15M2V1OSJ9.tGVdqK-172exvdrohQ5dcw';
// var map = new mapboxgl.Map({
// container: 'map',
// style: 'mapbox://styles/mapbox/streets-v10'
// });


// // _center: yu
// // lat: 30.575288149872037
// // lng: 104.06438185263232


// mapboxgl.accessToken = 'pk.eyJ1IjoiZWxsZXJ5bGkiLCJhIjoiY2pvaTJjMjRsMDRvYzNwdDZzcG15M2V1OSJ9.tGVdqK-172exvdrohQ5dcwpk.eyJ1IjoiZWxsZXJ5bGkiLCJhIjoiY2pvaTJjMjRsMDRvYzNwdDZzcG15M2V1OSJ9.tGVdqK-172exvdrohQ5dcw';
// const map = new mapboxgl.Map({
//   container: 'map',
//   style: 'mapbox://styles/mapbox/streets-v9',
//   center: [ -0.077, 51.533 ],
//   zoom: 12
// });
