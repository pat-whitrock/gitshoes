$(document).ready () ->
  firstItem = $('.list-group-item').sort( (a, b) ->
    contentA = parseInt( $(a).attr('data-repo-id'));
    contentB = parseInt( $(b).attr('data-repo-id'));
    return (Number(contentA) < Number(contentB)) ? -1 : (Number(contentA) > Number(contentB)) ? 1 : 0;
  ).first()
  firstItem.addClass('active')
  firstItemUrl = firstItem.attr('href')
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
