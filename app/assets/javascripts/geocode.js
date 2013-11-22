'use strict';
(function($){
  $(document).ready(function(){

    // restrict the auto completes to cities within Australia
    var geoOpts = {
      componentRestrictions:{country:'au'}, //restrict autocomplete to filter by country
      types:['(cities)']
    };

    // http://ubilabs.github.io/geocomplete/ reference Events
    // set the geocomplete event on the element with class depart
    $('.geocode .depart').geocomplete(geoOpts).bind('geocode:result', function(event,result){
      // if the geocode was successful
      $("#trip_locations_attributes_0_lat").val(result.geometry.location.lat());
      $("#trip_locations_attributes_0_long").val(result.geometry.location.lng());
    });

    // set the geocomplete event on the element with class destination
    $('.geocode .destination').geocomplete(geoOpts).bind('geocode:result',function(event,result){
      $("#trip_locations_attributes_1_lat").val(result.geometry.location.lat());
      $("#trip_locations_attributes_1_long").val(result.geometry.location.lng());
    });

    // bind the datepicker to the element with class date on the home > index view
    $('.geocode .date').datepicker({ dateFormat: 'yy-mm-dd' });
  });
})(jQuery);
