$(".book").load(function() {
  alert("here");
  var $container = $(this).parents(".container");
  $container.width($(this).width())
  $container.height($(this).height())
});
