//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require jquery
////= require jquery_ujs
//= require bootstrap-sprockets

$(document).ready(function() {
  window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove();
    });
  }, 2000);
});
