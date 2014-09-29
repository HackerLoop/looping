ready = ->
  $('#new_user').each ->
    referral_code = $.getQuery('ref')
    $(@).find('input[name=ref]').val(referral_code)

$(document).ready(ready)
$(document).on('page:load', ready)
