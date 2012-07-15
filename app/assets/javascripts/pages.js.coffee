$(document).ready ->
  $('#help').tooltip()

  $github_drag_link = $("#github-drag-link")
  $github_drag_link.hide()

  $twitter_drag_link = $("#twitter-drag-link")
  $twitter_drag_link.hide()

  $linkedin_drag_link = $("#linkedin-drag-link")
  $linkedin_drag_link.hide()

  $("#drag-box").draggable
    scroll: false

  $("#github").droppable
    tolerance: "touch",
    over: (event, ui) ->
      $this = $(this)
      unless $this.hasClass("selected")
        $this.addClass("selected")
        $github_drag_link.show()

    out: (event, ui) ->
      $this = $(this)
      if $this.hasClass("selected")
        $this.removeClass("selected").find(".github-link").hide()
        $github_drag_link.hide()

  $("#twitter").droppable
    tolerance: "touch",
    over: (event, ui) ->
      $this = $(this)
      unless $this.hasClass("selected")
        $this.addClass("selected")
        $twitter_drag_link.show()

    out: (event, ui) ->
      $this = $(this)
      if $this.hasClass("selected")
        $this.removeClass("selected").find(".twitter-link").hide()
        $twitter_drag_link.hide()

  $("#linkedin").droppable
    tolerance: "touch",
    over: (event, ui) ->
      $this = $(this)
      unless $this.hasClass("selected")
        $this.addClass("selected")
        $linkedin_drag_link.show()

    out: (event, ui) ->
      $this = $(this)
      if $this.hasClass("selected")
        $this.removeClass("selected").find(".linkedin-link").hide()
        $linkedin_drag_link.hide()
