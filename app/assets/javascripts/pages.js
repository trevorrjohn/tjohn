$(document).ready(function() {
  $('body').height($(window).height());

  $(window).resize(function() {
    $('body').height($(window).height());
  });
  var redToggle = true;
  $("#red").click(function() {
    var width = $(window).width()/3 - 40;

    if(redToggle) {
      redToggle = false;
      $(this).animate({"left": "+=" + width + "px"}, "slow");
    } else {
      redToggle = true;
      $(this).animate({"left": "-=" + width + "px"}, "slow");
    }
  })
});


