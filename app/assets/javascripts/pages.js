var isTwoPanes = function() {
  console.log($("#info").width() + 100)
  console.log("Window width: " + $(window).width()/3)
  return ($("#info").width() + 50 > $(window).width()/3)
}

var setSizes = function() {
  var width = $(window).width();
  var $base = $("#base");
  var $red = $("#red");
  var $orange = $("#orange");
  var $info = $("#info");

  $('body').height($(window).height());
  if(isTwoPanes()) {
    $base.hide();

    $red.width(width/2);
    $orange.width(width/2);

    $orange.offset({left: width/2 - 5});
  } else {
    $base.show();
    $base.width(width/3);
    $red.width(width/3);
    $orange.width(width/3);

    $red.offset({left: 5})
    $orange.offset({left: width/3})
    $base.offset({left: 2/3 * width - 5})
  }
}

$(document).ready(function() {
  var $base = $("#base");
  var $red = $("#red");
  var $info = $("#info");
  var redToggle = true;

  $(window).resize(function() {
    setSizes();
    redToggle = true;
  })

  $red.click(function() {
    var width = $(window).width();
    var move = $info.width() + 40;

    if(isTwoPanes()) {
      if(redToggle) {
        redToggle = false;
        console.log('2 slider on');
        $(".slider").animate({"left": "+=" + move + "px"}, "slow");
      } else {
        redToggle = true;
        console.log('2 slider off');
        $(".slider").animate({"left": "-=" + move + "px"}, "slow");
      }
    } else {
      if(redToggle) {
        redToggle = false;
        console.log('3 slider on');
        $(this).animate({"left": "+=" + move + "px"}, "slow");
      } else {
        redToggle = true;
        console.log('3 slider off');
        $(this).animate({"left": "-=" + move + "px"}, "slow");
      }
    }
  })
  $(window).trigger('resize');
})
