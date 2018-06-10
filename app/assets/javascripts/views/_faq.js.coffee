$(document).on('turbolinks:load', () ->
  $('.ui.accordion')
    .accordion()

  $('.ui.accordion').accordion('refresh')
)
