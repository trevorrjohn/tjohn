$(function(){
  $("img.book").load(function() {
    var $this = $(this);
    var width = $this.width();
    var height = $this.height();
    var scale = 1;

    if($this.parent(".face").next(".face").children("p").text() == "") {
      scale = 0.75;
      $this.css({ height: height * scale, width: width * scale });
    }

    $this.parents(".container").css({ height: height * scale, width: width * scale });
  });

  var $wrapper = $("#wrapper");
  $wrapper.imagesLoaded(function(){
    $wrapper.masonry({
      itemSelector : '.container',
      isAnimated : true
    });
  })
});
