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
//= require bootstrap
//= require turbolinks
//= require_tree .


function compute_file(){
    $("#user_profile_attachment_file").hide();
    $("#user_profile_show_file_input").show();
}

function tweetcountChar(val) {
    var max = 50;
    var len = val.value.length;
    if (len >= max) {
        $('#tweetChar').text(' You have reached the limit (maximum is 50 characters)');
    } else {
        var char = max - len;
        $('#tweetChar').text(char + ' Characters Left');
        $('#tweet_err_info ul li').remove();
    };
    if (len == 0) {
        $('#tweetChar').hide();
    } else{
        $('#tweetChar').show();
    };
}