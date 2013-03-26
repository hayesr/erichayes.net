jQuery ->
  page = $('#page')
  $.eric ||= {}
  
  $.eric.toggle_mode = ->
    $.eric.mobile = $(window).width() < 768;
    
  $.eric.toggle_mode()
  
  $(window).on 'resize', ->
    $.eric.toggle_mode()
    