# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('.datatable').dataTable({
    "sPaginationType": "bootstrap",
    "oLanguage": {
      "sLengthMenu": 'Display <select>'+
        '<option value="20">20</option>'+
        '<option value="30">30</option>'+
        '<option value="40">40</option>'+
        '<option value="50">50</option>'+
        '<option value="-1">All</option>'+
        '</select> records'
    },
    "iDisplayLength": 20,
    "bAutoWidth": false,
    "aaSorting": [[2,'desc']],

    "fnInitComplete": () ->
        $("#table_filter input").addClass("form-control")
        $("#table_filter label").text("")
        $("#table_filter label").append("<span class='glyphicon glyphicon-search'></span> <input type='text' aria-controls='table' class='form-control' placeholder='Search'>")
        $("#table").show()
        this.fnAdjustColumnSizing()
    
  })

