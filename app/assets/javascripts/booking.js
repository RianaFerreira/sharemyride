$(document).ready(function(){
  $('.btn_book').click(function(event){
    // get a handle on clicked button
    var self = $(this);
    // get the book_path of the clicked button from index or show view
    var url = self.attr('href');

    if(self.attr('disabled') != "disabled"){
      // decrement the avaialble seats for the trip the user booked
      $.ajax({
        type: "POST",
        url: url,
        dataType: "json",
        success: function(response){

          // decrement available number of seats on the index or show view
          $('#seats-'+response.id).html(response.seats_available);

          // on page reload only display the trips that the user has not booked

        }
      });

      // disable the button that the user clicked
      self.attr('disabled', true);

  }
    event.preventDefault();
    return false;
  });
});
