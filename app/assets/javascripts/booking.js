$(document).ready(function(){
  $('.btn_book').click(function(event){
    var self = $(this);
    var url = self.attr('href');
    console.log(url);

    $.ajax({
      type: "POST",
      url: url,
      dataType: "json",
      success: function(response){
        console.log(response);
        //decrement available number of seats on the page
        $('#seats-'+response.id).html(response.seats_available);
        //self.parent().parent().children('.seats_available').html(response.seats_available);
      }
    });

    event.preventDefault();
    return false;
  });
});
