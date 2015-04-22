$( document ).ready(function() {
  $(".roll-dice-btn").on("click", function(){
  	var request = $.ajax({
  		url: '/rolldice',
  		type: "GET"
  	});

  	request.done(function(response){
      result = $(response).filter(".dice-container");
      $(".all-dice").html($(result).html());
  	});
  });
});