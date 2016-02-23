ready = ->
  $('a[data-target]').click (e) ->
    e.preventDefault()
    $this = $(this)
    if $this.data('target') == 'Hinzufügen zum'
      url = $this.data('addurl')
      new_target = "Entfernen aus"
    else
      url = $this.data('removeurl')
      new_target = "Hinzufügen zum"
    $.ajax url: url, type: 'put', success: (data) ->
      $('.cart-count').html(data)
      $this.find('span').html(new_target)
      $this.data('target', new_target)

$(document).ready(ready)
$(document).on('page:load', ready)