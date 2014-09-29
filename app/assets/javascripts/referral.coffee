$ ->
  $('#new_user').each ->
    referral_code = $.getQuery('ref')
    $(@).find('input[name=ref]').val(referral_code)
