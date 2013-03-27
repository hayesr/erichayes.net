# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('a[data-img]').on 'click', ->
    target = $(this).data('img')
    $('#' + target).slideToggle()
    return false