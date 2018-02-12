

$(document).ready(function() {
  $( function() {
    $( "#datepicker" ).datepicker({
      dateFormat: "dd-mm-yy",
      beforeShowDay: function(day) {
        //
      }
    });
  });
});
