var map;
$(document).ready(function () {
    map = new GMaps({
        div: '#map',
        lat: 57.6914,
        lng: 11.9731
    });
    performGeolocation();
    addMarkers();
});
function addMarkers() {
  if (gon.global.selected_restaurants != 'none' && gon.global.selected_restaurants.length > 0) {
    console.log("You're in selected restaurants" + gon.global.selected_restaurants);
    gon.global.selected_restaurants.forEach(function (restaurant) {
      console.log(restaurant.latitude + " " + restaurant.longitude);
        map.addMarker({
            lat: restaurant.latitude,
            lng: restaurant.longitude
        });
    });
    delete gon.global.selected_restaurants;
    console.log("Here's the selected_restaurants: " + gon.global.selected_restaurants);
  } else {
        console.log("You're in all restaurants");
        gon.restaurants.forEach(function (restaurant) {
            map.addMarker({
                lat: restaurant.latitude,
                lng: restaurant.longitude
            });
        });
    }
}
function performGeolocation() {
    var latitude;
    var longitude;
    var testing_env = $('#map').data().testEnv;
    if (testing_env == false) {
        GMaps.geolocate({
            success: function (position) {
                latitude = position.coords.latitude;
                longitude = position.coords.longitude;
                map.setCenter(latitude, longitude);
            },
            error: function (error) {
                alert('Geolocation failed: ' + error.message);
            },
            not_supported: function () {
                alert('Your browser does not support geolocation');
            }
        });
    } else {
        latitude = 59.3293235;
        longitude = 18.0685808;
        map.setCenter(latitude, longitude);
    }
}
