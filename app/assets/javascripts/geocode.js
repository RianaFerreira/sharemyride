'use strict';
(function($){
  $(document).ready(function(){
    var geoOpts = {
      componentRestrictions:{country:'au'},
      types:['(cities)']
    };
    $('.geocode .depart').geocomplete(geoOpts).bind('geocode:result', function(event,result){
      //http://ubilabs.github.io/geocomplete/
      console.log(result.geometry.location.lat());
      console.log(result.geometry.location.lng());
    });
    $('.geocode .destination').geocomplete(geoOpts);
    $('.geocode .date').datepicker({ dateFormat: 'yy-mm-dd' });
  });
})(jQuery);
