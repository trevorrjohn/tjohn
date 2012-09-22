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

  var orangeToggle = true;
  $("#orange").click(function() {
    var width = $(window).width()/3 - 40;

    if(orangeToggle) {
      orangeToggle = false;
      $(this).animate({"left": "+=" + width + "px"}, "slow");
    } else {
      orangeToggle = true;
      $(this).animate({"left": "-=" + width + "px"}, "slow");
    }
  })

  var baseToggle = true;
  $("#base").click(function() {
    var width = $(window).width()/3 - 40;

    if(baseToggle) {
      baseToggle = false;
      $(this).animate({"right": "+=" + width + "px"}, "slow");
    } else {
      baseToggle = true;
      $(this).animate({"right": "-=" + width + "px"}, "slow");
    }
  })
});


