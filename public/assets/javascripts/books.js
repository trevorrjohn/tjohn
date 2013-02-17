$(function(){
  $(".book").load(function() {
    var $container = $(this).parents(".container");
    $container.width($(this).width())
    $container.height($(this).height())
  });
})
