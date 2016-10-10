var map;
document.addEventListener("turbolinks:load", function() {
  map = new GMaps({
    div: '#map',
    lat: 57.690123,
    lng: 11.950632,
    zoom: 13,
    zoomControlOptions: {
      position: google.maps.ControlPosition.RIGHT_BOTTOM
    },
    mapTypeControl: false,
    streetViewControl: false
  });
  var selection;
  performGeolocation();
});

function addMarkers() {
  if (selection == ('All Restaurants')) {
    map.removeMarkers();
    gon.all_restaurants.forEach(function(restaurant) {
      placeMarkers(restaurant);
    });
  } else {
    map.removeMarkers();
    gon.all_restaurants.forEach(function(restaurant) {
      if (restaurant.category == selection) {
        placeMarkers(restaurant);
      }
    });
  }
}

function placeMarkers(restaurant) {
  if (restaurant.latitude !== null) {
    map.addMarker({
      lat: restaurant.latitude,
      lng: restaurant.longitude,
      title: restaurant.name,
      infoWindow: {
        content: "<a href='/restaurants/" + restaurant.id + "'>" + restaurant.name + "</a>"
      }
    });
  }
}

function performGeolocation(lat, lng) {
  var latitude;
  var longitude;
  var testing_env = $('#map').data().testEnv;
  if (testing_env === false) {
    GMaps.geolocate({
      success: function(position) {
        latitude = position.coords.latitude;
        longitude = position.coords.longitude;
        map.setCenter(latitude, longitude);
      },
      error: function(error) {
        alert('Geolocation failed: ' + error.message);
      },
      not_supported: function() {
        alert('Your browser does not support geolocation');
      }
    });
  } else {
    latitude = lat || 57.690123;
    longitude = lng || 11.950632;
    map.setCenter(latitude, longitude);
  }
}
