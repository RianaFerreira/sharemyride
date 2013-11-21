$(document).ready(function(){
 var map = new google.maps.Map(document.getElementById("map-canvas"), {
  mapTypeId:google.maps.MapTypeId.ROADMAP});
  var rendererOptions = { map: map };
  var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
  var directionsService = new google.maps.DirectionsService();
 $('#myModal').on('opened', function () {
  google.maps.event.trigger(map, "resize");
});

 $('.map-modal').on('click', function(event){
    var self = $(this);
    var url = self.attr('href');

    $.ajax({
      type: "GET",
      url: url,
      dataType: "json",
      success: function(response){
        console.log(response);
        var org = new google.maps.LatLng (response.locations[0].lat, response.locations[0].long);
        var dest = new google.maps.LatLng (response.locations[1].lat, response.locations[1].long);


        var request = {origin: org,
          destination: dest,
          travelMode: google.maps.DirectionsTravelMode.DRIVING
        };


        directionsService.route(request, function(response, status) {
          if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
            map.fitBounds(response.routes[0].bounds);
            map.panToBounds(response.routes[0].bounds);
          }
          else
            alert ('failed to get directions');
        });

        $('#myModal').foundation('reveal', 'open');
      }

    });

    event.preventDefault();
  });
});