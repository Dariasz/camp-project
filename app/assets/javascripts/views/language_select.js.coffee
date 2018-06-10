$ ->

  $('.language_select').on("click", (e) ->
    e.preventDefault()
    $el = $(e.target)

    $.ajax
      url: $el.data('url')
      type: "get"

      beforeSend: ->
        $('.pusher').html('<div class="ui active loader"</div>')

      success: (response) ->
        window.location.reload()
  )