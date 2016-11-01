// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require moment
//= require bootstrap-datetimepicker
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('ready turbolinks:load', function(){
  var data = {'data-date-format': 'YYYY-MM-DD hh:mm' };
  var classes = ['.search_from','.search_to','.register_from','.register_to'];

  $.each(classes,function(index, val){
  $(val).attr(data);
  $(val).datetimepicker({
    useCurrent: false,
    stepping: 30
    });
  });
  $('.search_from').on("dp.change", function (e) {
    $('.search_to').data("DateTimePicker").minDate(e.date);
  });
  $('.search_to').on("dp.change", function (e) {
    $('.search_from').data("DateTimePicker").maxDate(e.date);
  });
  $('.register_from').on("dp.change", function (e) {
    $('.register_to').data("DateTimePicker").date(e.date.add(16, 'minutes'));
  });

  $('.register_to').prop('disabled',true);
  $('.search_btn').on("click", function(){
    $('.register_to').prop('disabled',false);
  })

});
