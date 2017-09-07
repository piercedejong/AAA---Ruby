function buy_unit(element) {
	$.ajax({
       method: "GET",
       data:{
       	uid: element.getAttribute("data-uid")
       },
       url: window.location.origin + '/game/buy_unit'
	})
  .done(function(response) {
		if(response["change"]){
			change_eco_nation(response);
			$("#"+response["name"]).text(response["count"]);
	    $("#"+response["nation"]+"-bank").text(response["bank"]);
			$("#c-nation").text(response["nation"]+"-"+response["bank"])
		}else {
			$("#"+response["name"]).text(response["count"]);
	    $("#"+response["nation"]+"-bank").text(response["bank"]);
			$("#eco-bank").text("Bank "+response["bank"]);
			$("#c-nation").text(response["nation"]+"-"+response["bank"])
		}
  })
}

function end_turn() {
	var count = 0;
  $.ajax({
    method: "GET",
    url: window.location.origin + '/game/end_turn'
  })
  .done(function(response) {
		$("#"+response["oo_nation"]+"-bank").text(response["oo_bank"]);
    $("#"+response["o_nation"]+"-bank").text(response["o_bank"]);
    $("#c-nation").text(response["nation"]+"-"+response["bank"]);
    $("#c-nation").css("color",response["color"]);
		$('#end-turn').css("background",response["color"]);
		$('#roundel').attr("src","/assets/"+response['roundel']);
		$('.btn-unit').each(function(){
			if(count%2==0){
				$(this).css("background",response["color"]);
			}else{
				$(this).css("background",response["colorL"]);
			}
			count++;
		})
		$(".table-top").css("color",response["color"]);
    $("#reset").css("background",response["color"]);
    $('.count').text("0");
		change_eco_nation(response);

		if(response["nation"] == ("Britain" || "UK Europe")){
			$("#pacific").css("background",response["color"]);
			$("#pacific").show();
		}else{
			$("#pacific").hide();
		}
  })
}

function reset_buy() {
  $.ajax({
    method: "GET",
    url: window.location.origin + '/game/reset_buy'
  })
  .done(function(response) {
    $("#"+response["nation"]+"-bank").text(response["bank"]);
		$("#c-nation").text(response["nation"]+"-"+response["bank"]);
		$("#eco-bank").text("Bank "+response["bank"]);
    $('.count').text("0");
  })
}

function change_eco() {
	$.ajax({
       method: "GET",
       url: window.location.origin + '/game/change_eco'
	})
  .done(function(response) {
  	change_eco_nation(response)
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
		if(response["same_n"]){
			$("#c-nation").text(response["nation"]+"-"+response["bank"])
		}
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

function buy_pacific(element) {
	$("#pacific").hide();
	$.ajax({
		method: "GET",
	  data:{
	  },
	  url: window.location.origin + '/game/buy_pacific'
	})
	.done(function(response) {
		$("#c-nation").text(response["nation"]+"-"+response["bank"]);
    $("#c-nation").css("color",response["color"]);
		$('#end-turn').css("background",response["color"]);
		$('#roundel').attr("src","/assets/"+response['roundel']);
		$('.count').text("0");
		change_eco_nation(response);
	})
}

function home() {
  $.ajax({
    method: "GET",
    url: window.location.origin + '/game/exit'
  })
}

function change_eco_nation(response){
	$("#change-eco").text(response["nation"]);
	$("#change-eco").css("background",response["color"])
	$("#eco-bank").text("Bank "+response["bank"]);
	$("#eco-income").text("Income "+response["income"]);
	$(".change-eco-pos").css("background",response["colorL"])
	$(".change-eco-neg").css("background",response["color"])
	$("#objective").css("background",response["color"]);
	$("#objective").attr("href", "/nations/"+response["uuid"]);
	$("#victory").css("background",response["colorL"]);
	$("#research").css("background",response["color"]);
}
