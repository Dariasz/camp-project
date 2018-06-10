$(document).on('turbolinks:load', () ->
  $('.ui.dropdown')
    .dropdown()

  $('.left.sidebar').first()
    .sidebar('attach events', '.toc.item')

  $('.top.sidebar').last()
    .sidebar('attach events', '.user-menu.item')

  $('.tabular.menu .item').tab()

  $('.login-modal')
    .on('click', () ->
      $target = $(this).data().tab
      $.tab('change tab', $target)
      $('.modal').find('.active').removeClass('active')
      $('.modal').find('[data-tab = '+ $target + ']').addClass('active')
    )

  $('.modal').modal('attach events', '.login-modal', 'show')

  $('.toggle.checkbox').checkbox('attach events', '.toggle.button')

  $(".alert" ).fadeOut(3000)

  $('.modal.new-attachment').modal('attach events', '.new-attachment', 'show')

  $('.new-attachment')
    .popup({
    on: 'click'
  })

  $('.assistants')
    .popup({
    popup : $('.popup.assistants'),
    position   : 'bottom center',
    inline: true,
  })

  $('.example .menu .browse')
    .popup({
    inline     : true,
    hoverable  : true,
    position   : 'bottom left',
    delay: {
      show: 300,
      hide: 800
    }
  })

)
