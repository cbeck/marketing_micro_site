$(document).ready(function() {	  
  $('.flexslider').flexslider({
      animation: "slide",
      slideshowSpeed: 7000,
      pauseOnHover: true
  });
  
  $('#gallery a').lightBox();
});

function printObject(o) {
  var out = '';
  for (var p in o) {
    out += p + ': ' + o[p] + '\n';
  }
  alert(out);
}

