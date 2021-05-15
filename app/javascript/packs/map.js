// console.log('Hello from /javascript/packs/mapTwo.js')
// var map = L.map("map", {
//   center: [32.813764236164246, 34.99735056504973],
//   zoom: 13
// });
// L.tileLayer.provider('OpenStreetMap.Mapnik').addTo(map);
// var OpenStreetMap_Mapnik = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
// 	maxZoom: 19,
// 	attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
// });
// OpenStreetMap_Mapnik.addTo(map);

// L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
//     attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
//     maxZoom: 18,
//     id: 'mapbox/streets-v11',
//     tileSize: 512,
//     zoomOffset: -1,
//     accessToken: 'pk.eyJ1IjoiY29kZS1jaXJjbGUiLCJhIjoiY2tvcHVhN25iMG93aDJ2c2o3dTl5YnZ1diJ9.Rvm7HGxwSnjLs6bYKswCIg'
// }).addTo(map);
console.log("Map");
var map = L.map('map').fitWorld();

// L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={pk.eyJ1IjoiY29kZS1jaXJjbGUiLCJhIjoiY2tvcHVhN25iMG93aDJ2c2o3dTl5YnZ1diJ9.Rvm7HGxwSnjLs6bYKswCIg}', {
//     attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
//     maxZoom: 18,
//     tileSize: 512,
//     zoomOffset: -1
// }).addTo(map);

L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoiY29kZS1jaXJjbGUiLCJhIjoiY2tvcHVhN25iMG93aDJ2c2o3dTl5YnZ1diJ9.Rvm7HGxwSnjLs6bYKswCIg'
}).addTo(map);

function onLocationFound(e) {
    var radius = e.accuracy;

    L.marker(e.latlng).addTo(map)
        .bindPopup("You are within " + radius + " meters from this point").openPopup();

    L.circle(e.latlng, radius).addTo(map);
}

function onLocationError(e) {
  alert(e.message);
}

var popup = L.popup();

function onMapClick(e) {
    popup
        .setLatLng(e.latlng)
        .setContent("You clicked the map at " + e.latlng.toString())
        .openOn(map);
}

map.on('click', onMapClick);

map.on('locationfound', onLocationFound);

map.on('locationerror', onLocationError);

map.locate({setView: true, maxZoom: 16});
