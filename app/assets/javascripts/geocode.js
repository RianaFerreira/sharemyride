'use strict';
(function($){
  $(document).ready(function(){
    // geocode and datepicker applied on the search, add and edit trip views
    // restrict the auto completes to cities within Australia
    var geoOpts = {
      componentRestrictions:{country:'au'}, //restrict autocomplete to filter by country
      types:['(cities)']
    };

    // http://ubilabs.github.io/geocomplete/ reference Events
    // the autocomplete will work on all fields with the .geocode and .depart classes (search, new and edit views)
    $('.geocode .depart').geocomplete(geoOpts).bind('geocode:result', function(event, result){
      // if the geocode lookup was successful set the lat an long values on the hidden fields in new and edit views
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
