// reference for implementation http://www.cannonade.net/geo31.js
// reference for rendering map on full canvas area http://stackoverflow.com/questions/16321577/google-maps-api-v3-foundation-4-reveal-modal-not-displaying-properly
$(document).ready(function() {
  // prevents googlemaps error on non js pages if the canvas element doesn't exist
  if($('#map-canvas').length == 0){
    //this javascript should only run when map modal is in the DOM
    return;
  }

  // google api
  var directionsDisplay = new google.maps.DirectionsRenderer();
  var directionsService = new google.maps.DirectionsService();

  // initialize map on the canvas of the foundation modal in the index view
  var map = new google.maps.Map(document.getElementById("map-canvas"), {
    mapTypeId:google.maps.MapTypeId.ROADMAP});

  // url of trip that was clicked
  var url;

  // link directions to the map
  directionsDisplay.setMap(map);

  // on the show view when the Route Map button is clicked
  $('.btn_map').on('click', function(event){
    event.preventDefault();
    var self = $(this);
    url = self.attr('href');
    showMap();

  });

  // on index view departure link click opens the modal
  $('.map-modal').on('click', function(event){
    event.preventDefault();
    var self = $(this);
    url = self.attr('href');
    $('#myModal').foundation('reveal', 'open');
  });

    var showMap = function(){
      console.log('here');
    // load the map on the full canvas not only the top left corner
    google.maps.event.trigger(map, "resize");
    $.ajax({
      type: "GET",
      url: url,
      dataType: "json",
      success: function(response){
        // get the longitude and latitude location values of the selected tip
        var org = new google.maps.LatLng (response.locations[0].lat, response.locations[0].long);
        var dest = new google.maps.LatLng (response.locations[1].lat, response.locations[1].long);

        // get the driving directions for the trip long and lat from google for Driving mode
        var request = {origin: org,
          destination: dest,
          travelMode: google.maps.DirectionsTravelMode.DRIVING
        };

        // gets response for the driving directions from google and renders route on the map
        directionsService.route(request, function(response, status) {
          if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
         } else {
            alert ('failed to get directions');
         }
        });

      }

    });

  };

  // once the modal has finished rendering
  $('#myModal').on('opened',showMap);

});
