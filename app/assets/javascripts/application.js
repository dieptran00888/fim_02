// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-datepicker
//= require bootstrap
//= require mediaelement_rails
//= require adminlte
$(document).on('turbolinks:load', function () {
  $current = 1;
  $('#audio-player').on('ended', function () {
    $source='';
    $('#audio-player').attr('src', nextSource());
  });
});

function nextSource() {
  var src = $('.list-group').children().children().eq($current).attr('data');
  $current++;
  return src;
}
