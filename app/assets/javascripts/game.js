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
	var count = 0;
  $.ajax({
    method: "GET",
    url: window.location.origin + '/game/end_turn'
  })
  .done(function(response) {
    $("#"+response["nation"]+"-bank").text(response["bank"]);
    $("#c-nation").text(response["n_nation"]);
    $("#c-nation").css("color",response["n_color"]);
		$('#end-turn').css("background",response["n_color"]);
		$('.btn-unit').each(function(){
			if(count%2==0){
				$(this).css("background",response["n_color"]);
			}else{
				$(this).css("background",response["n_colorL"]);
			}
			count++;
		})

		$("#change-eco").text(response["n_nation"]);
    $("#change-eco").css("background",response["n_color"])
		$(".change-eco-pos").css("background",response["n_colorL"])
		$(".change-eco-neg").css("background",response["n_color"])
    $('.count').text("0");
		$("#eco-bank").text("Bank "+response["n_bank"]);
		$("#eco-income").text("Income "+response["n_income"]);
  })
}

function reset_buy() {
  $.ajax({
    method: "GET",
    url: window.location.origin + '/game/reset_buy'
  })
  .done(function(response) {
    $("#"+response["nation"]+"-bank").text(response["bank"]);
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
		$("#eco-bank").text("Bank "+response["bank"]);
		$("#eco-income").text("Income "+response["income"]);
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
		$("#eco-bank").text("Bank "+response["bank"]);
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
		$("#eco-income").text("Income "+response["income"]);
	})
}
