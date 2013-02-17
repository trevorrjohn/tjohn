$(function(){
  $(".book").load(function() {
    var $container = $(this).parents(".container");
    $container.width($(this).width())
    $container.height($(this).height())
  });

  var $wrapper = $("#wrapper");
  $wrapper.imagesLoaded(function(){
    $wrapper.masonry({
      itemSelector : '.container',
      columnWidth : 240,
      isAnimated : true
    });
  })
});
