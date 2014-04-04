# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


currentURL = window.location.pathname
if (currentURL == "/")
  $('body').addClass("background")
else
  $('body').removeClass("background")


return



