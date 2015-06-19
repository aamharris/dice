// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree

$( document ).ready(function() {
    $( "input[name='player_1']" ).keyup(function() {
    	if ($(this).val() == "")
    	{
    		$("label[for='player_1']").html("Player 1");
    	}
    	else
    	{
    		$("label[for='player_1']").html($(this).val())	
    	}
		});

		$( "input[name='player_2']" ).keyup(function() {
  		if ($(this).val() == "")
    	{
    		$("label[for='player_2']").html("Player 2");
    	}
    	else
    	{
    		$("label[for='player_2']").html($(this).val())	
    	}
	});
}); 

