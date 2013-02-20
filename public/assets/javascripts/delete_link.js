$(function() {
  $(".delete_link").click( function() {
    if(confirm('Are you sure?')) {
      var form = document.createElement('form');
      $(this).after($(form).attr({
        method: "post",
        action: $(this).attr("href")
      }).append("<input type='hidden' name='_method' value='DELETE' />"));

      $(form).submit();
    }
    return false;
  });
});
