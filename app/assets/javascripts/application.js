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
//= require jquery.raty
//= require ratyrate
//= require ckeditor/init
//= require chosen-jquery

$(document).on('turbolinks:load', function () {
  $current = 1;
  $('.list-group-item').eq($current-1).css('background', 'wheat');
  $('.contribute-lyric').hide();
  $('.contribute-lyric').eq($current-1).show();
  $('.tabs-lyric').hide();
  $('.tabs-lyric').eq($current-1).show();
  $('.tab-lyric-content').hide();
  $('.tab-lyric-content').eq($current-1).show();
  $('#audio-player').on('ended', function () {
    $source='';
    $('.contribute-lyric').eq($current-1).hide();
    $('.tabs-lyric').eq($current-1).hide();
    $('.tab-lyric-content').eq($current-1).hide();
    $('.list-group-item').eq($current-1).css('background', 'none');
    $('#audio-player').attr('src', nextSource());
  });

  $('.reply').hide();
  $('.button-reply').on('click', function () {
    $(this).parent().next().show();
  });

  $('.chosen-select').chosen();
  $('.chosen-container-single').css('width', '250px');

});

function nextSource() {
  var src = $('.list-group').children().children().eq($current).attr('data');
  $('.list-group-item').eq($current).css('background', 'wheat');
  $('.contribute-lyric').eq($current).show();
  $('.tabs-lyric').eq($current).show();
  $('.tab-lyric-content').eq($current).show();
  $current++;
  return src;
}
