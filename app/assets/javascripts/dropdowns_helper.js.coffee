applyDropdowns = ($wrapper) ->
  if $wrapper
    $selects = $wrapper.find("select.dropdown")
  else
    $selects = $("select.dropdown")
  $selects.dropdown(
    forceSelection: false
  )

$(document).on "ready", -> applyDropdowns()
$(document).on "turbolinks:load", -> applyDropdowns()
$(document).on "nested:fieldAdded", (e) ->
  applyDropdowns e.field
