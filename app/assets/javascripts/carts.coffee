ready = ->
  $('#einkaufswagen .fi-x').click (e) ->
    e.preventDefault()
    $this = $(this).closest('a')
    url = $this.data('targeturl')
    $.ajax url: url, type: 'put', success: (data) ->
      $('.cart-count').html(data)
      $this.closest('.cart-whisky').slideUp()

$(document).ready(ready)
$(document).on('page:load', ready)