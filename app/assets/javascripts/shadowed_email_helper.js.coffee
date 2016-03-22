$(document).on "click", ".shadowed-email-placeholder", (e) ->
  $(e.target).remove()
  $(".true-shadowed-email").removeClass "hidden"
  false
