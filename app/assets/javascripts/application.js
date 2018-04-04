//= require jquery
//= require sweetalert2
//= require rails-ujs
//= require turbolinks
//= require jquery.turbolinks
//= require bootstrap
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require toastr
//= require catpants
//= require_tree .


$(document).on('turbolinks:load', function() {
  window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove();
    });
  }, 2000);
  $('#datetimepicker1').datetimepicker();
});

toastr.options = {
  "closeButton": false,
  "debug": false,
  "newestOnTop": false,
  "progressBar": false,
  "positionClass": "toast-top-right",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}
