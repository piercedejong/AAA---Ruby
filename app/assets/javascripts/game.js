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
    $("#c-nation").css("color",response["n_color"]);
		$("#c-nation").css("font-size","3.5vw");
		$('#end-turn').css("background",response["n_color"]);
		$('.btn-unit').css("background",response["n_color"]);
		$("#change-eco").text(response["n_nation"]);
    $("#change-eco").css("background",response["n_color"])
		$(".change-eco-pos").css("background",response["n_colorL"])
		$(".change-eco-neg").css("background",response["n_color"])
    $('.count').text("0");
  })
}

function change_eco() {
	$.ajax({
       method: "GET",
       url: window.location.origin + '/game/change_eco'
	})
  .done(function(response) {
  	$("#change-eco").text(response["nation"]);
    $("#change-eco").css("background",response["color"])
		$(".change-eco-pos").css("background",response["colorL"])
		$(".change-eco-neg").css("background",response["color"])
  })
}

function change_bank(element) {
	$.ajax({
       method: "GET",
       data:{
       	amount: element.getAttribute("data-amount")
       },
       url: window.location.origin + '/game/change_bank'
	})
  .done(function(response) {
    $("#"+response["nation"]+"-bank").text(response["bank"]);
  })
}

function change_income(element) {
	$.ajax({
		method: "GET",
	  data:{
	  	amount: element.getAttribute("data-amount")
	  },
	  url: window.location.origin + '/game/change_income'
	})
	.done(function(response) {
		$("#"+response["nation"]+"-income").text(response["income"]);
	})
}
