$(document).ready(function() {
  // prevents googlemaps error on non js pages if the canvas element doesn't exist
  if($('#myModal').length == 0){
    //this javascript should only run when map modal is in the DOM
    return;
  }

  //google api
  var directionsDisplay = new google.maps.DirectionsRenderer();
  var directionsService = new google.maps.DirectionsService();

  //initialize map on the canvas
  var map = new google.maps.Map(document.getElementById("map-canvas"), {
    mapTypeId:google.maps.MapTypeId.ROADMAP});

  // url of trip that was clicked
  var url;

  //link directions to the map
  directionsDisplay.setMap(map);

  //link click opens the modal
  $('.map-modal').on('click', function(event){
    event.preventDefault();
    var self = $(this);
    url = self.attr('href');
    $('#myModal').foundation('reveal', 'open');
  });

  //once the modal has finished rendering
  $('#myModal').on('opened', function () {
    google.maps.event.trigger(map, "resize");
    $.ajax({
      type: "GET",
      url: url,
      dataType: "json",
      success: function(response){
        var org = new google.maps.LatLng (response.locations[0].lat, response.locations[0].long);
        var dest = new google.maps.LatLng (response.locations[1].lat, response.locations[1].long);

        var request = {origin: org,
          destination: dest,
          travelMode: google.maps.DirectionsTravelMode.DRIVING
        };

        //gets response for the driving directions from google and renders on the map
        directionsService.route(request, function(response, status) {
          if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
         } else {
            alert ('failed to get directions');
         }
        });

      }

    });

  });

});
