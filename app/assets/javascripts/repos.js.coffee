# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $(document).ready () ->
jQuery ->
  $('.datatable').dataTable({
    "sPaginationType": "bootstrap",
    "iDisplayLength": 30,
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
        $("#table").show()
        this.fnAdjustColumnSizing()
    
  })
