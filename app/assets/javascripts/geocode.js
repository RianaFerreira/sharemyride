'use strict';
(function($){
  $(document).ready(function(){
    var geoOpts = {
      componentRestrictions:{country:'au'},
      types:['(cities)']
    };
    $('.geocode .depart').geocomplete(geoOpts).bind('geocode:result', function(event,result){
      //http://ubilabs.github.io/geocomplete/
      $("#trip_locations_attributes_0_lat").val(result.geometry.location.lat());
      $("#trip_locations_attributes_0_long").val(result.geometry.location.lng());
    });

    $('.geocode .destination').geocomplete(geoOpts).bind('geocode:result',function(event,result){
      $("#trip_locations_attributes_1_lat").val(result.geometry.location.lat());
      $("#trip_locations_attributes_1_long").val(result.geometry.location.lng());
    });
    $('.geocode .date').datepicker({ dateFormat: 'yy-mm-dd' });
  });
})(jQuery);
