function buy_unit(element) {
	$.ajax({
       method: "GET",
       data:{
       	uid: element.getAttribute("data-uid")
       },
       url: window.location.origin + '/game/buy_unit'
	})
  .done(function(response) {
  	$("#"+response["name"]).text(response["count"]);
    $("#"+response["nation"]+"-bank").text(response["bank"]);
  })
}

function end_turn() {
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
}
