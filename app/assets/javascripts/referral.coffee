$ ->
  $('#new_user').each ->
    referral_code = $.getQuery('ref')
    $(@).find('#user_referral_code').val(referral_code)
