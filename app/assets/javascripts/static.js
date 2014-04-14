$(document).ready(function(){
  var paths = $('path');
  var currentURL = window.location.pathname
  if (currentURL == "/"){
      $('body').addClass("background")
  };

  $.each(paths, function(i, path){
    var length = path.getTotalLength();
    // Clear any previous transition
    path.style.transition = path.style.WebkitTransition =
      'none';
    // Set up the starting positions
    path.style.strokeDasharray = length + ' ' + length;
    path.style.strokeDashoffset = length;
    // Trigger a layout so styles are calculated & the browser
    // picks up the starting position before animating
    path.getBoundingClientRect();
    // Define our transition
    path.style.transition = path.style.WebkitTransition =
      'stroke-dashoffset 6s ease-in-out';
    // Go!
    path.style.strokeDashoffset = '0';
  });
});