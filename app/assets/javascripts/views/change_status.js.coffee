$(document).on('turbolinks:load', ()->

  $('.change_status').on("click", (e) ->
    e.preventDefault()
    $el = $(e.target)

    $.ajax
      url: $el.data('url')
      type: "get"

      success: (response) ->
        window.location.reload()
  )
)
