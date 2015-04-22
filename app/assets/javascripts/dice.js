$( document ).ready(function() {
  $(".roll-dice-btn").on("click", function(){
  	console.log("Click!")
  	var request = $.ajax({
  		url: '/game',
  		type: "GET"
  	});

  	request.done(function(response){
  		console.log(response)
  	});
  });
});