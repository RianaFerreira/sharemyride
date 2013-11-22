$(document).ready(function(){
  $('.btn_book').click(function(event){
    var self = $(this);
    //get the book_path of the clicked button from index or show view
    var url = self.attr('href');

    $.ajax({
      type: "POST",
      url: url,
      dataType: "json",
      success: function(response){
        //decrement available number of seats on the index or show view
        $('#seats-'+response.id).html(response.seats_available);
        //self.parent().parent().children('.seats_available').html(response.seats_available);
      }
    });

    event.preventDefault();
    return false;
  });
});
