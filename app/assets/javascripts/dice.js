$( document ).ready(function() {
  $(".player-turn-btn").on("click", function(){
    $(".all-dice").empty();
    $(".player-turn-btn").hide();
    $(".roll-dice-btn").show(); 
  })

  $(".roll-dice-btn").on("click", function(){
  	var request = $.ajax({
  		url: '/rolldice',
  		type: "GET"
  	});

  	request.done(function(response){
      var name = response.name
      result = $(response.html_content).filter(".dice-container");
      $(".all-dice").html($(result).html());
      $(".player-turn-btn").html(name + "'s Turn")

      $(".roll-dice-btn").hide();
      $(".player-turn-btn").show(); 
  	});
  });
});