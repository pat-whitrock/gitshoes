# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready () ->
  $('.list-group>a:first').addClass('active')
  firstItemUrl = $('.list-group>a:first').attr('href')
  $.ajax({
      url: firstItemUrl,
      dataType: "html",
      success: (data) ->
        $('.col-md-9').html(data)
    })
  $('.list-group').on('click', '.list-group-item', (e) ->
    e.preventDefault()
    $(".list-group>.list-group-item").removeClass('active')
    $(this).addClass('active')
    itemUrl = $(this).attr('href')
    $('.col-md-9').empty()
    $.ajax({
      url: itemUrl,
      dataType: "html",
      success: (data) ->
        $('.col-md-9').html(data)
    })
  )