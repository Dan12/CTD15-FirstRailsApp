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
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  
  var SERVER_URL = "http://ruby-on-rails-114302.nitrousapp.com";
  
  $('.submit-btn').click(function(){
    console.log("clicked");
    $('body').append('<p>Hello There</p>');
    submitForm();
  });
  
  function submitForm(){
    $.ajax({
        type: "POST",
        url: "/submitForm",
        data: {name: $('.name').val(), numbers: $('.nums').val()},
        success: function(data, textStatus, jqXHR) {
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert("Error=" + errorThrown);
        }
    });
  }
});