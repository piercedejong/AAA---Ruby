$(document).ready(function(){
	$("#end-turn").click(function() {
    $.ajax({
      method: "GET",
      url: window.location.origin + '/game/end_turn'
    })
    .done(function(response) {
      $("#"+response["nation"]+"-bank").text(response["bank"]);
      $("#c-nation").text(response["n_nation"]);
      $("#c-nation").css("color", "rgb("+response["n_color"]+")");
			$('.count').text("0");
    })
  });
});
