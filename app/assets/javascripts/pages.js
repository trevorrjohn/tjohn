$(function() {
  var width = $(window).width();
  var height = $(window).height();
  var $container = $("#container");

  $container.width(width);
  $container.height(height);

  var paper = Raphael(document.getElementById("container"), width, height);
  var circle = paper.circle(width/2, height/2, (width > height ? height/2 : width/2) );
  circle.attr("fill", "#f00");
  circle.attr("stroke", "#e2e2e2");
})
