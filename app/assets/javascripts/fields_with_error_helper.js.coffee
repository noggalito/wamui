# apply .error class (styled by semantic)
# to wrapper
$(document).on "ready", ->
  $(".field_with_errors").parent().addClass "error"
