
  # function sticky_relocate() {
  #   var window_top = $(window).scrollTop();
  #   var div_top = $('#sticky-anchor').offset().top;
  #   if (window_top > div_top) {
  #     $('#select-product').addClass('stick');
  #   } else {
  #     $('#select-product').removeClass('stick');
  #   }
  # }
  # 
  # $(function() {
  #   $(window).scroll(sticky_relocate);
  #   sticky_relocate();
  # });
$.eric ||= {}
  
$.eric.scroll_stick = () ->
  window_top = $(window).scrollTop();
  header = $('#page > header')
  anchor = $('#scroll_anchor').offset().top
  if window_top > anchor
    header.addClass('stick') unless $.eric.mobile
  else
    header.removeClass('stick')

jQuery ->
  $.eric.scroll_stick()
  $(window).on 'scroll', ->
    $.eric.scroll_stick()